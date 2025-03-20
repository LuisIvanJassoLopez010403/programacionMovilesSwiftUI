//
//  TemperatureView.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 17/02/25.
//

import SwiftUI

struct TemperatureView: View {
    @StateObject private var viewModel = TemperatureViewModel()
    var body: some View {
        VStack {
            Text("Temperature Converter")
                .font(.title2)
                .bold()
            
            TextField("Enter temperature in Celsius: ", text: $viewModel.celsius)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
            
            Text("Temperature in Fahrenheit: \(String(format: "%.1f", viewModel.fahrenheit))ºF")
                .padding()
            
            Image("\(viewModel.image)")
                .resizable()
                .frame(width: 100, height: 100)
            
            Button("Convert") {
                viewModel.convert()
                viewModel.getImage()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    TemperatureView()
}
