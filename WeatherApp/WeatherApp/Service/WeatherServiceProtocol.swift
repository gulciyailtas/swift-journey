//
//  WeatherServiceProtocol.swift
//  WeatherApp
//
//  Created by Gülçiya İltaş on 12.12.2025.
//

import Foundation
protocol WeatherAPIClientProtocol {
    func fetchData(forCity city: String) async throws -> Data
}

protocol WeatherServiceProtocol {
    func fetchWeather(forCity city: String) async throws -> WeatherData
}
