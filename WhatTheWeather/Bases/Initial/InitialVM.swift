//
//  InitialVM.swift
//  WhatTheWeather
//
//  Created by Michał Wolanin on 12/02/2024.
//

import Foundation
import Combine

class InitialVM {
    var cityText: String = ""
    @Published var weatherModel: WeatherModel?

    var cancellables = Set<AnyCancellable>()
    
    func getWeather() {
        let service = WeatherService()
        service.baseURL = "https://api.openweathermap.org/data/2.5/weather?q=\(cityText.escaped())&appid=d0803efee719201d68c3bc66f0005655&units=metric"
        
        service.getWeather { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let weather):
                DispatchQueue.main.async {
                    self.weatherModel = weather
                    AppData().set(self.cityText, for: .userCity)
                }
            case .failure(let error):
                print("Error with InitialVM")
                print(error.localizedDescription)
            }
        }
    }
}
