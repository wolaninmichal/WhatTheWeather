//
//  AppCore.swift
//  WhatTheWeather
//
//  Created by Michał Wolanin on 12/02/2024.
//

import Foundation
import UIKit

protocol AppCoreDelegate{
    var root: UINavigationController {get set}
}

class AppCore: AppCoreDelegate{
    
    var root: UINavigationController = .init()

    init(){
        setupBar()
        
        let userCity: String? = AppData().get(.userCity)
        if let city = userCity {
            setupWeatherResultVC(city: city)
        } else {
            setupInitialView()
        }
    }
    
    func setupBar(){}
    

    
    func setupWeatherResultVC(city: String? = nil, animate: Bool = false){
        let vc = InitialVC()
        if let city = city {
            vc.viewModel.cityText = city
            vc.viewModel.getWeather()
        }
        root.setViewControllers([vc], animated: animate)
    }
    
    func setupInitialView(animate: Bool = false) {
        let vc = InitialVC()
        root.setViewControllers([vc], animated: animate)
    }
}
