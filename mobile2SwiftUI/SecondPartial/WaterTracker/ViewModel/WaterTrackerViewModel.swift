//
//  WaterTrackerViewModel.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 27/03/25.
//

import Foundation

import SwiftUI

class WaterTrackerViewModel: ObservableObject {
    @Published var water1: Bool = false
    @Published var water2: Bool = false
    @Published var water3: Bool = false
    @Published var waterTotal: Int = 0
    
    func addWater() {
        if(water1) {
            waterTotal += 250
        } else if(water2) {
            waterTotal += 500
        } else {
            waterTotal += 1000
        }
    }
}
