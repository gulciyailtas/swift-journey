//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Gülçiya İltaş on 12.12.2025.
//

import SwiftUI
struct WeatherView: View {
    
    @StateObject var viewModel = WeatherViewModel(
        service: WeatherService(
            apiClient: OpenWeatherAPIClient()
        )
    )
    
    @State private var city: String = "Batman"
    
    var body: some View {
        VStack {
            Text("Hava Durumu Sorgulama")
                .font(.largeTitle)
                .padding(.bottom, 20)

            HStack {
                TextField("Şehir Adı Giriniz", text: $city)
                    .textFieldStyle(.roundedBorder)
                    .autocorrectionDisabled(true)
                
                Button("Ara") {
                    Task {
                        await viewModel.loadWeather(forCity: city)
                    }
                }
                .disabled(viewModel.isLoading)
                .buttonStyle(.borderedProminent)
            }
            .padding(.horizontal)

            if viewModel.isLoading {
                ProgressView("Yükleniyor...")
                    .padding(.top, 50)
            } else if let data = viewModel.displayData {
                VStack(spacing: 15) {
                    if data.iconURL != nil {
                        Text("☀️")
                            .font(.system(size: 80))
                    }
                    Text(data.cityName)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(data.temperature)
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                    Text(data.description)
                        .font(.headline)
                }
                .padding(.top, 50)
            } else if let error = viewModel.errorMessage {
                Text("Hata: \(error)")
                    .foregroundColor(.red)
                    .padding(.top, 50)
            }
            
            Spacer()
        }
        .onAppear {
            Task {
                await viewModel.loadWeather(forCity: city)
            }
        }
    }
}
