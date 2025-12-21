//
//  OpenWeatherAPIClient.swift
//  WeatherApp
//
//  Created by Gülçiya İltaş on 12.12.2025.
//

import Foundation

// Protokolü tam burada tanımlıyoruz ki başka dosyaya ihtiyaç kalmasın.
protocol WeatherAPIClientProtocol {
    func fetchData(forCity city: String) async -> Result<Data, APIError>
}

class OpenWeatherAPIClient: WeatherAPIClientProtocol {
    private let apiKey = "44193c36c6cbe338c772fc3c2f7bb710"
    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"

    func fetchData(forCity city: String) async -> Result<Data, APIError> {
        guard city.count >= 2 else { return .failure(.invalidURL) }
        
        var components = URLComponents(string: baseURL)
        components?.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "units", value: "metric")
        ]
        
        guard let url = components?.url else { return .failure(.invalidURL) }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse else { return .failure(.unknown) }

            if (200...299).contains(httpResponse.statusCode) {
                return .success(data)
            } else {
                return .failure(.invalidStatusCode(httpResponse.statusCode))
            }
        } catch {
            return .failure(.requestFailed(error))
        }
    }
}
