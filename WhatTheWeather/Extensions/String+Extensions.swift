//
//  String+Extensions.swift
//  WhatTheWeather
//
//  Created by Michał Wolanin on 17/02/2024.
//

import Foundation

extension String{
    
    func escaped() -> String{
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}



