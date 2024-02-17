//
//  WeatherResponse.swift
//  WhatTheWeather
//
//  Created by Michał Wolanin on 17/02/2024.
//

struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
