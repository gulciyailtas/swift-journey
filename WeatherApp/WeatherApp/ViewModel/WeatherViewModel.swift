//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Gülçiya İltaş on 12.12.2025.
//

import Foundation
import Combine

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var displayData: WeatherDisplay?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service: WeatherServiceProtocol
    private let suggestions = ["vn": "Van", "btm": "Batman", "ist": "Istanbul", "ank": "Ankara", "kst": "Kastamonu"]

    init(service: WeatherServiceProtocol) {
        self.service = service
    }

    func loadWeather(forCity city: String) async {
        let input = city.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        
        if input.isEmpty {
            self.errorMessage = "Lütfen bir şehir adı girin."
            return
        }

        if let suggestion = suggestions[input] {
            self.errorMessage = "'\(input)' yerine '\(suggestion)' mı demek istediniz?"
            return
        }

        isLoading = true
        errorMessage = nil
        
        let result = await service.fetchWeather(forCity: input)
        
        switch result {
        case .success(let data):
            displayData = WeatherDisplay(
                cityName: data.name,
                temperature: String(format: "%.1f°C", data.main.temp),
                description: data.weather.first?.description.capitalized ?? "Bilinmiyor",
                iconURL: URL(string: "https://openweathermap.org/img/wn/\(data.weather.first?.icon ?? "")@2x.png")
            )
        case .failure(let error):
            errorMessage = handleError(error)
        }
        isLoading = false
    }

    private func handleError(_ error: APIError) -> String {
        switch error {
        case .invalidURL: return "Geçersiz adres."
        case .requestFailed: return "Ağ hatası."
        case .decodingFailed: return "Veri okuma hatası."
        case .invalidStatusCode(let code):
            return code == 404 ? "Şehir bulunamadı." : "Sunucu hatası: \(code)"
        case .unknown: return "Bilinmeyen hata."
        }
    }
}
