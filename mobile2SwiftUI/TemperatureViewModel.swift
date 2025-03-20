//
//  TemperatureViewModel.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 18/02/25.
//

import Foundation

import SwiftUI

class TemperatureViewModel: ObservableObject {
    @Published var celsius: String = ""
    @Published var fahrenheit: Float = 0.0
    @Published var image: String = "question"
    
    func convert() {
        let cel = Float(celsius) ?? 0.0
        fahrenheit = (cel * (9/5) + 32)
    }
    
    func getImage() {
        if(fahrenheit < 50) {
            image = "snowman"
        } else if(fahrenheit >= 50 && fahrenheit <= 85) {
            image = "beach"
        } else {
            image = "sun"
        }
    }
}
