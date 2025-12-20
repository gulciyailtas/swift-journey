//
//  OpenWeatherAPIClient.swift
//  WeatherApp
//
//  Created by Gülçiya İltaş on 12.12.2025.
//

import Foundation
// Gerçek URLSession çağrısını yapacak sınıf (API Client)
class OpenWeatherAPIClient: WeatherAPIClientProtocol {
    
    private let apiKey = "44193c36c6cbe338c772fc3c2f7bb710"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"

    func fetchData(forCity city: String) async throws -> Data {
        guard var components = URLComponents(string: baseURL) else {
            throw APIError.invalidURL
        }
        
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "units", value: "metric")
        ]
        
        guard let url = components.url else {
            throw APIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.unknown
        }
    
        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidStatusCode(httpResponse.statusCode)
        }
        
        return data // Ham veriyi dondur
    }
}
