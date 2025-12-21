//
//  WeatherModels.swift
//  WeatherApp
//
//  Created by Gülçiya İltaş on 12.12.2025.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed(Error)
    case decodingFailed(Error)
    case invalidStatusCode(Int)
    case unknown
}

struct WeatherData: Codable {
    let name: String
    let main: MainInfo
    let weather: [WeatherInfo]
}

struct MainInfo: Codable {
    let temp: Double
    let humidity: Int
}

struct WeatherInfo: Codable {
    let description: String
    let icon: String
}

struct WeatherDisplay {
    let cityName: String
    let temperature: String
    let description: String
    let iconURL: URL?
}
