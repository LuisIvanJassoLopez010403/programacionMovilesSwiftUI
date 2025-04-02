//
//  ShakeView.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 01/04/25.
//

import SwiftUI

struct ShakeView: View {
    @StateObject var viewModel = ShakeViewModel()
    
    var body: some View {
        VStack {
            Text("Materia aleatoria: \(viewModel.materias.first ?? "No hay más materias")")
                .padding()
                .font(.title)
        }
        .onShake {
            if let materia = viewModel.getMateria() {
                print("Nueva materia seleccionada: \(materia)")
            }
        }
    }
}
