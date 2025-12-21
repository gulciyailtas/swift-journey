//
//  WeatherViewModel.swift
//  WeatherAppTests
//
//  Created by Gülçiya İltaş on 12.12.2025.
//

import XCTest
import Combine
@testable import WeatherApp // Projenizin adını buraya yazın

// MARK: - Mock API Clients

// TEST: Başarılı yanıt veren Mock API Client
class MockSuccessAPIClient: WeatherAPIClientProtocol {
    func fetchData(forCity city: String) async throws -> Data {
        // Sabit kodlanmış, başarılı bir OpenWeatherMap JSON yanıtı
        let jsonString = """
        {
            "name": "MockCity",
            "main": {"temp": 18.2, "humidity": 65},
            "weather": [{"description": "parçalı bulutlu", "icon": "04d"}]
        }
        """
        return jsonString.data(using: .utf8)!
    }
}

// TEST: Hata (404 Not Found) fırlatan Mock API Client
class MockFailureAPIClient: WeatherAPIClientProtocol {
    func fetchData(forCity city: String) async throws -> Data {
        // Sunucu bulunamama (404) hatası fırlat
        throw APIError.invalidStatusCode(404)
    }
}

// MARK: - ViewModel Testleri

final class WeatherViewModelTests: XCTestCase {

        func test_loadWeather_success() async throws {
            
            await MainActor.run {
                let mockClient = MockSuccessAPIClient()
                let service = WeatherService(apiClient: mockClient)
                let viewModel = WeatherViewModel(service: service)
                Task { @MainActor in
                     await viewModel.loadWeather(forCity: "MockCity")
                    XCTAssertFalse(viewModel.isLoading)
                    XCTAssertNil(viewModel.errorMessage)
                    XCTAssertEqual(viewModel.displayData?.cityName, "MockCity")
                    XCTAssertEqual(viewModel.displayData?.temperature, "18.2°C")
                }
            }
        }
        func test_loadWeather_failure_handles404() async {
            await MainActor.run {
                let mockClient = MockFailureAPIClient()
                let service = WeatherService(apiClient: mockClient)
                let viewModel = WeatherViewModel(service: service)
                Task { @MainActor in
                    await viewModel.loadWeather(forCity: "NonExistentCity")
                    XCTAssertFalse(viewModel.isLoading)
                    XCTAssertNil(viewModel.displayData)
                    XCTAssertEqual(viewModel.errorMessage, "Şehir bulunamadı.")
                }
            }
        }
    }
