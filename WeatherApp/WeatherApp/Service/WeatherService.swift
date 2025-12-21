//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Gülçiya İltaş on 12.12.2025.
//

import Foundation

protocol WeatherServiceProtocol {
    func fetchWeather(forCity city: String) async -> Result<WeatherData, APIError>
}

class WeatherService: WeatherServiceProtocol {
    private let apiClient: WeatherAPIClientProtocol

    init(apiClient: WeatherAPIClientProtocol) {
        self.apiClient = apiClient
    }

    func fetchWeather(forCity city: String) async -> Result<WeatherData, APIError> {
        let result = await apiClient.fetchData(forCity: city)
        
        switch result {
        case .success(let data):
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                return .success(weatherData)
            } catch {
                return .failure(.decodingFailed(error))
            }
        case .failure(let error):
            return .failure(error)
        }
    }
}
