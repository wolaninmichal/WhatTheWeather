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
    private let conditionLabel: Label
    private let conditionImage: UIImageView

    
    var weatherModel: WeatherModel? {
        didSet {
            updateUI()
        }
    }
    
    init(weatherModel: WeatherModel) {
        self.cityNameLabel = Label(text: "", size: 24, alignment: .center)
        self.temperatureLabel = Label(text: "", size: 20, alignment: .center)
        self.humidityLabel = Label(text: "", size: 20, alignment: .center)
        self.conditionLabel = Label(text: "", size: 20, alignment: .center)
        self.conditionImage = UIImageView(image: nil)
        self.weatherModel = weatherModel
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
        print(UIScreen.main.bounds.width)

    }

    private func setupViewBackground(){
        view.backgroundColor = UIColor(named: "text")
        conditionImage.contentMode = .scaleAspectFill
    }
    
    private func setupViewComponents(){
        humidityLabel.textColor = UIColor(named: "background")
        temperatureLabel.textColor = UIColor(named: "background")
        cityNameLabel.textColor = UIColor(named: "background")
        conditionLabel.textColor = UIColor(named: "background")
        conditionImage.tintColor = UIColor(named: "background")
        
        view.addSubview(conditionImage)
        conditionImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(50)
            $0.width.equalTo(100)
            $0.height.equalTo(100)
        }
        
        view.addSubview(conditionLabel)
        conditionLabel.snp.makeConstraints {
            $0.centerX.equalTo(conditionImage.snp.centerX)
            $0.bottom.equalTo(conditionImage.snp.top).offset(-16)
        }
        
        view.addSubview(humidityLabel)
        humidityLabel.snp.makeConstraints {
            $0.centerX.equalTo(conditionLabel.snp.centerX)
            $0.bottom.equalTo(conditionLabel.snp.top).offset(-16)
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
        guard let weather = weatherModel else { return }
        cityNameLabel.text = weather.name
        temperatureLabel.text = weather.temperatureString
        humidityLabel.text = weather.humidityString
        conditionLabel.text = weather.conditionName
        conditionImage.image = UIImage(systemName: weather.conditionName)
        conditionImage.tintColor = UIColor(named: "background")
        
    }
}
