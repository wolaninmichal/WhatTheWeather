//
//  WeatherModel.swift
//  WhatTheWeather
//
//  Created by Michał Wolanin on 19/02/2024.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let name: String
    let temp: Double
    let humiditiy: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temp)
    }
    
    var humidityString: String{
        return String(format: "%.1f", humiditiy)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801:
            return "cloud.few"
        case 802:
            return "cloud.scattered"
        case 803:
            return "cloud.broken"
        case 804:
            return "cloud.overcast"
        default:
            return "cloud"
        }
    }
    
}
