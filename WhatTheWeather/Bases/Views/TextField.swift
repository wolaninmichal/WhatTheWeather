//
//  textField.swift
//  WhatTheWeather
//
//  Created by Michał Wolanin on 14/02/2024.
//

import UIKit
import SnapKit

class TextField: UITextField {
    
    var textChanged: (String) -> Void = {_ in}
    
    init(placeholder: String? = nil,
         size: CGFloat = 18,
         colorOfText: UIColor = .black,
         colorOfField: UIColor = .white) {
        
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        self.font = UIFont.systemFont(ofSize: size)
        self.textColor = colorOfText
        self.backgroundColor = colorOfField
        self.borderStyle = .roundedRect
        self.font = UIFont(name: "PlayfairDisplay-Medium", size: size)
        
        let locationIconImageView = UIImageView(image: UIImage(systemName: "location"))
        locationIconImageView.tintColor = UIColor(named: "mainText")
        self.leftView = locationIconImageView
        self.leftViewMode = .always
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func commonInit(){
        addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    func bind(callback: @escaping (String) -> Void){
        textChanged = callback
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField){
        if let text = textField.text {
            textChanged(text)
        }
    }
    
}
