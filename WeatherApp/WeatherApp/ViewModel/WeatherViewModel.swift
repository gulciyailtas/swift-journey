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
    
    init(service: WeatherServiceProtocol) {
        self.service = service
    }

    func loadWeather(forCity city: String) async {
        isLoading = true
        errorMessage = nil
        
        do {
            let rawData = try await service.fetchWeather(forCity: city)
            
            displayData = WeatherDisplay(
                cityName: rawData.name,
                temperature: String(format: "%.1f°C", rawData.main.temp),
                description: rawData.weather.first?.description.capitalized ?? "Bilinmiyor",
                iconURL: rawData.weather.first.flatMap { icon in
                    URL(string: "https://openweathermap.org/img/wn/\(icon.icon)@2x.png")
                }
            )
        } catch let apiError as APIError {
            errorMessage = handleError(apiError)
        } catch {
            errorMessage = "Bilinmeyen bir sistem hatası oluştu."
        }
        
        isLoading = false
    }

    private func handleError(_ error: APIError) -> String {
        switch error {
        case .invalidURL:
            return "Geçersiz Adres."
        case .requestFailed:
            return "Ağ bağlantısı hatası. İnternetinizi kontrol edin."
        case .decodingFailed:
            return "Sunucudan alınan veri biçimi hatalı."
        case .invalidStatusCode(let code):
            if code == 404 { return "Şehir bulunamadı." }
            return "Sunucu hatası: Kod \(code)"
        case .unknown:
            return "Bilinmeyen bir hata oluştu."
        }
    }
}
