//
//  Label.swift
//  WhatTheWeather
//
//  Created by Michał Wolanin on 12/02/2024.
//


import UIKit
import SnapKit

class Label: UILabel {
    init(text: String? = nil,
         size: CGFloat = 18,
         alignment: NSTextAlignment = .left) {
        
        super.init(frame: .zero)
        self.text = text
        self.font = UIFont(name: "PlayfairDisplay-Regular", size: size)
        self.textColor = UIColor(named: "text")
        self.numberOfLines = 0
        self.textAlignment = alignment
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
    }
    
    init(text: String? = nil,
         font: UIFont = UIFont(name: "PlayfairDisplay-Regular", size: 18)!) {
        print(font)
        super.init(frame: .zero)
        self.text = text
        self.font = UIFont(name: "PlayfairDisplay-Regular", size: 30)
        self.textColor = UIColor(named: "text")
        self.numberOfLines = 0
        self.textAlignment = .natural
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func wrapped() -> UIView {
        let view = UIView()
        view.addSubview(self)
        self.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        return view
    }
}
