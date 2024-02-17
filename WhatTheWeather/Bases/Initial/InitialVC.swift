//
//  InitialVC.swift
//  WhatTheWeather
//
//  Created by Michał Wolanin on 12/02/2024.
//

import Foundation
import UIKit
import MapKit
import SnapKit

class InitialVC: UIViewController {
    
    private var serviceButton: UIButton
    private let mainButton: UIButton
    private let text: Label
    private let logo: UIImageView
    private let locationTextField: TextField
    private var arrowButton: ArrowButton?
    
    internal var viewModel: InitialVM
    
    
    init() {
        viewModel = .init()
        mainButton = .init()
        serviceButton = .init()
        text = .init(
            text: "Type your city.",
            alignment: .center)
        logo = UIImageView(image: UIImage(named: "logoBig"))
        locationTextField = .init(
            placeholder: "City",
            size: 16,
            colorOfText: UIColor(named: "text") ?? .black,
            colorOfField: .white)
        super.init(nibName: nil, bundle: nil)
        
        arrowButton = .init()
        arrowButton?.addTarget(self, action: #selector(checkCity), for: .touchUpInside)
        
        setupViewModel()
        
        setupViewBackground()
        setupViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupViewBackground(){
        view.backgroundColor = UIColor(named: "background")
        logo.contentMode = .scaleAspectFit
    }
    
    private func setupViewComponents() {
        guard let arrowButton = arrowButton else {return}
        view.addSubview(arrowButton)
        arrowButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(50)
            
        }
        
        view.addSubview(locationTextField)
        locationTextField.snp.makeConstraints {
            $0.centerX.equalTo(arrowButton.snp.centerX)
            $0.bottom.equalTo(arrowButton.snp.top).offset(-16)
            
            $0.width.equalTo(view.snp.width).multipliedBy(0.70)
        }
        
        view.addSubview(text)
        text.snp.makeConstraints {
            $0.centerX.equalTo(locationTextField.snp.centerX)
            $0.bottom.equalTo(locationTextField.snp.top).offset(-16)
        }
        
        view.addSubview(logo)
        logo.snp.makeConstraints {
            $0.centerX.equalTo(text.snp.centerX)
            $0.bottom.equalTo(text.snp.top).offset(-16)
            $0.width.equalTo(view.snp.width).multipliedBy(0.55)
            $0.height.equalTo(logo.snp.width).multipliedBy(0.5)
        }
    }
    
    private func setupViewModel() {
        locationTextField.bind { [unowned self] text in
            print(text)
            self.viewModel.cityText = text
        }
        
    }
    
    @objc private func checkCity(){
            viewModel.getWeather(city: locationTextField.text ?? "")
        }
    
}
