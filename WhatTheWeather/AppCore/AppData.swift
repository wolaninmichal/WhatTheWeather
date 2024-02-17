//
//  AppData.swift
//  WhatTheWeather
//
//  Created by Michał Wolanin on 12/02/2024.
//


import Foundation
import UIKit

struct AppData {
    
    private let defaults = UserDefaults(suiteName: "group.com.wolaninmichal.AdwWeatherMVVM")
    
    func get<T>(_ key: AppDataKey) -> T? {
        defaults?.value(forKey: key.rawValue) as? T
    }
    
    func get<T>(_ key: String) -> T? {
        defaults?.value(forKey: key) as? T
    }
    
    func set(_ data: Any?, for key: AppDataKey) {
        defaults?.set(data, forKey: key.rawValue)
    }
    
    func set(_ data: Any?, for key: String) {
        defaults?.set(data, forKey: key)
    }
    
}
