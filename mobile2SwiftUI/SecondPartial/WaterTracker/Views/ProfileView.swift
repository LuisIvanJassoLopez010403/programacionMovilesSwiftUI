//
//  ProfileView.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 24/03/25.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Name: ")
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .padding(.top)
                .padding(.horizontal)
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.default)
                .padding(.horizontal)
            
            Text("Age: ")
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .padding(.top)
                .padding(.horizontal)
            TextField("Age", text: $viewModel.age)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding(.horizontal)
            
            Text("Weight: ")
                .frame(maxWidth: .infinity, alignment: .leading)
                .bold()
                .padding(.top)
                .padding(.horizontal)
            TextField("Weight", text: $viewModel.weight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding(.horizontal)
                .padding(.bottom)
            
            Button("Save") {
                viewModel.saveData()
            }
            .bold()
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
           
        }
        .padding()
        .navigationTitle("Profile Screen")
        .onAppear {
            viewModel.name = viewModel.savedName
            viewModel.age = viewModel.savedAge
            viewModel.weight = viewModel.savedWeight
        }
    }
}

