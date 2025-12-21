//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Gülçiya İltaş on 12.12.2025.
//

import SwiftUI
struct WeatherView: View {
    @StateObject var viewModel = WeatherViewModel(service: WeatherService(apiClient: OpenWeatherAPIClient()))
    @State private var city: String = "Batman" //
    
    var body: some View {
        VStack {
            Text("Hava Durumu Sorgulama").font(.largeTitle).padding(.bottom, 20)

            HStack {
                TextField("Şehir Adı (Örn: vn)", text: $city)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled(true)
                
                Button("Ara") {
                    Task { await viewModel.loadWeather(forCity: city) }
                }
                .disabled(viewModel.isLoading)
                .buttonStyle(.borderedProminent)
            }.padding(.horizontal)

            if viewModel.isLoading {
                ProgressView("Yükleniyor...").padding(.top, 50)
            } else if let error = viewModel.errorMessage {
                VStack {
                    Text(error).foregroundColor(.red)
                    // Öneri varsa düzeltme butonu göster
                    if error.contains("mı demek istediniz") {
                        Button("Evet, düzelt") {
                            if let suggestedCity = error.components(separatedBy: "'").safeElement(at: 3) {
                                city = String(suggestedCity)
                                Task { await viewModel.loadWeather(forCity: city) }
                            }
                        }.buttonStyle(.bordered).padding(.top, 5)
                    }
                }.padding(.top, 50)
            } else if let data = viewModel.displayData {
                weatherInfo(data)
            }
            Spacer()
        }
        .onAppear { Task { await viewModel.loadWeather(forCity: city) } }
    }

    private func weatherInfo(_ data: WeatherDisplay) -> some View {
        VStack(spacing: 15) {
            AsyncImage(url: data.iconURL) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)

            Text(data.cityName).font(.title).fontWeight(.bold)
            Text(data.temperature).font(.system(size: 60)).foregroundColor(.blue)
            Text(data.description).font(.headline)
        }.padding(.top, 50)
    }
}

// Güvenli array erişimi için
extension Array {
    func safeElement(at index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
