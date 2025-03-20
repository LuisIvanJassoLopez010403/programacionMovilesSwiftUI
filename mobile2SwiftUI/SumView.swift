//
//  SumView.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 17/02/25.
//

import SwiftUI

struct SumView: View {
    @StateObject private var viewModel = SumViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("Sum Calculator")
                .font(.title2)
                .bold()

            TextField("Enter number 1", text: $viewModel.number1)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()

            TextField("Enter number 2", text: $viewModel.number2)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()

            Button("Calculate Sum") {
                viewModel.calculateSum()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)

            // Integrate the UIAlertController
            if viewModel.showAlert {
                UIAlertControllerWrapper(title: "Result", message: "The sum is \(viewModel.result)", isPresented: $viewModel.showAlert)
            }
        }
        .padding()
    }
}

#Preview {
    SumView()
}
