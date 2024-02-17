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
        
        let userName: String? = AppData().get(.userName)
        let userPassword: String? = AppData().get(.userPassword)
        
        setupBar()
        
        if userName != nil, userPassword != nil{
            setupInitialView(animate: false)
        } else{
            setupLoginView()
        }
                
    }
    
    func setupBar(){}
    
    func setupLoginView(animate: Bool = false){
        let vc = InitialVC()
        root.setViewControllers([vc], animated: animate)
    }
    
    func setupInitialView(animate: Bool = false) {
        let vc = InitialVC()
        root.setViewControllers([vc], animated: animate)
    }
}
