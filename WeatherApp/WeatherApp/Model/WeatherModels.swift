//
//  WeatherModels.swift
//  WeatherApp
//
//  Created by Gülçiya İltaş on 12.12.2025.
//

import Foundation

struct WeatherData: Codable {
    let name: String // Şehir adı
    let main: Main // Ana sıcaklık bilgileri
    let weather: [Weather] // Hava durumu açıklamaları dizisi
}

// Ana sıcaklık ve nem bilgileri
struct Main: Codable {
    let temp: Double
    let humidity: Int
}


struct Weather: Codable {
    let description: String
    let icon: String
}

struct WeatherDisplay {
    let cityName: String
    let temperature: String
    let description: String
    let iconURL: URL?
}
