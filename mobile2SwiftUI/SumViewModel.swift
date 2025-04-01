//
//  SumViewModel.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 17/02/25.
//

import Foundation

import SwiftUI

class SumViewModel: ObservableObject {
    @Published var number1: String = ""
    @Published var number2: String = ""
    @Published var result: Int = 0
    @Published var showAlert: Bool = false

    func calculateSum() {
        let num1 = Int(number1) ?? 0
        let num2 = Int(number2) ?? 0
        result = num1 + num2
        showAlert = true 
    }
}
