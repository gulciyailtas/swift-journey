//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Gülçiya İltaş on 12.12.2025.
//

import Foundation
class WeatherService: WeatherServiceProtocol {
    
    private let apiClient: WeatherAPIClientProtocol

    init(apiClient: WeatherAPIClientProtocol) {
        self.apiClient = apiClient
    }

    func fetchWeather(forCity city: String) async throws -> WeatherData {
        let data = try await apiClient.fetchData(forCity: city)
        
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            return weatherData
        } catch {
            throw APIError.decodingFailed(error)
        }
    }
}
