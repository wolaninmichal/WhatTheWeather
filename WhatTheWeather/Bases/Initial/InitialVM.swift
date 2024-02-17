//
//  InitialVM.swift
//  WhatTheWeather
//
//  Created by Michał Wolanin on 12/02/2024.
//

import Foundation

class InitialVM {

    var cityText: String = ""
    var weatherResponse: WeatherResponse?
    var isModalPresented = false

    func getWeather(city: String) {
        let service = WeatherService()
        service.baseURL = "https://api.openweathermap.org/data/2.5/weather?q=\(cityText.escaped())&appid=d0803efee719201d68c3bc66f0005655"
        
        service.getWeather { result in
            switch result {
            case .success(let weather):
                print(weather.name)
                print(weather.main.humidity)
                print(weather.main.temp)
                DispatchQueue.main.async {
                    self.weatherResponse = weather
                    self.isModalPresented = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
