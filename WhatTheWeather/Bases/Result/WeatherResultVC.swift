//
//  WeatherResultVC.swift
//  WhatTheWeather
//
//  Created by Michał Wolanin on 18/02/2024.
//

import UIKit
import SnapKit

class WeatherResultViewController: UIViewController {
    
    private let cityNameLabel: Label
    private let temperatureLabel: Label
    private let humidityLabel: Label
    
    var weatherResponse: WeatherResponse? {
        didSet {
            updateUI()
        }
    }
    
    init(weatherResponse: WeatherResponse) {
        self.cityNameLabel = Label(text: "", size: 20, alignment: .center)
        self.temperatureLabel = Label(text: "", size: 18, alignment: .center)
        self.humidityLabel = Label(text: "", size: 18, alignment: .center)
        self.weatherResponse = weatherResponse
        super.init(nibName: nil, bundle: nil)
        
        setupViewBackground()
        setupViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    private func setupViewBackground(){
        view.backgroundColor = UIColor(named: "text")
    }
    
    private func setupViewComponents(){
        humidityLabel.textColor = UIColor(named: "background")
        temperatureLabel.textColor = UIColor(named: "background")
        cityNameLabel.textColor = UIColor(named: "background")
        
        view.addSubview(humidityLabel)
        humidityLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(50)
        }
        
        view.addSubview(temperatureLabel)
        temperatureLabel.snp.makeConstraints {
            $0.centerX.equalTo(humidityLabel.snp.centerX)
            $0.bottom.equalTo(humidityLabel.snp.top).offset(-16)
        }
        
        view.addSubview(cityNameLabel)
        cityNameLabel.snp.makeConstraints {
            $0.centerX.equalTo(temperatureLabel.snp.centerX)
            $0.bottom.equalTo(temperatureLabel.snp.top).offset(-16)
        }
        
    }

    private func updateUI() {
        guard let weather = weatherResponse else { return }
        cityNameLabel.text = weather.name
        temperatureLabel.text = "Temperature: \(weather.main.temp)°C"
        humidityLabel.text = "Humidity: \(weather.main.humidity)%"
    }
}
