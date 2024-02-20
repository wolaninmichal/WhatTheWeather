//
//  WeatherService.swift
//  WhatTheWeather
//
//  Created by Michał Wolanin on 17/02/2024.
//

import Foundation

struct Resource<T> {
    let url: URL
    let parse: (Data) -> T?
}

final class Webservice {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> ()) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    if let parsedData = resource.parse(data) {
                        completion(parsedData)
                        print(data)
                    } else {
                        completion(nil)
                    }
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}

class WeatherService {
    var baseURL = ""
    func getWeather(completion: @escaping (Result<WeatherModel, NetworkError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let resource = Resource(url: url) { data in
            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                let weatherModel = WeatherModel(conditionId: weatherResponse.weather.first?.id ?? 0,
                                                name: weatherResponse.name,
                                                temp: weatherResponse.main.temp,
                                                humiditiy: weatherResponse.main.humidity)
                return weatherModel
            } catch {
                print("Error decoding weather data:", error)
                print("Response:", String(data: data, encoding: .utf8) ?? "Unable to decode response data")
                return nil
            }
        }
        
        Webservice().load(resource: resource) { response in
            if let response = response {
                completion(.success(response))
            } else {
                completion(.failure(.noData))
            }
        }
    }
}
