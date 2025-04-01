//
//  WaterTrackerMainView.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 27/03/25.
//

import SwiftUI

struct WaterTrackerMainView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink(destination: WaterTrackerView()) {
                    Text("Water Tracker")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: ProfileView()) {
                    Text("Profile Screen")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Pantalla de Inicio")
        }
    }
}

