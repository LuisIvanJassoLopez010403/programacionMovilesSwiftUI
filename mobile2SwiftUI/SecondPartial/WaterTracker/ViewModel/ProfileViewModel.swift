//
//  ProfileViewModel.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 24/03/25.
//

import Foundation

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var age: String = ""
    @Published var weight: String = ""
    
    @AppStorage("savedName") var savedName: String = ""
    @AppStorage("savedAge") var savedAge: String = ""
    @AppStorage("savedWeight") var savedWeight: String = ""
    
    func saveData() {
        savedName = name
        savedAge = age
        savedWeight = weight
        
    }
}
