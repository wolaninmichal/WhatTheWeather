//
//  arrowButton.swift
//  WhatTheWeather
//
//  Created by Michał Wolanin on 14/02/2024.
//

import UIKit

class ArrowButton: UIButton {
    
    static private var height: CGFloat { 50 }
    static private var width: CGFloat { 200 }
    
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setupConstraints()
        setupView()
        setupAnimation()
    }
    
    private func setupView() {
        layer.masksToBounds = true
        
        var conf = UIButton.Configuration.filled()
        conf.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        conf.baseForegroundColor = UIColor(named: "mainText")
        
        let arrowImage = UIImage(systemName: "arrow.right")
        conf.image = arrowImage
        
        conf.background.backgroundColor = .clear
        
        configuration = conf
    }
    
    private func setupConstraints() {
        snp.makeConstraints {
            $0.height.equalTo(ArrowButton.height)
            $0.width.equalTo(ArrowButton.width)
        }
    }
    
    private func setupAnimation() {
        let expandAnimation = CABasicAnimation(keyPath: "bounds.size.width")
        expandAnimation.duration = 1.0
        expandAnimation.fromValue = ArrowButton.width
        expandAnimation.toValue = ArrowButton.width * 1.1
        expandAnimation.autoreverses = true
        expandAnimation.repeatCount = .infinity
        expandAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        layer.add(expandAnimation, forKey: "expandAnimation")
    }
}

