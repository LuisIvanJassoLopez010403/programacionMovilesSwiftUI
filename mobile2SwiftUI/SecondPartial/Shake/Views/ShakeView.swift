//
//  ShakeView.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 01/04/25.
//

import SwiftUI
import Lottie

struct ShakeView: View {
    @StateObject var viewModel = ShakeViewModel()
    @State private var materiaSeleccionada: String? = nil
    @State private var noMasCategorias = false
    
    var body: some View {
        VStack {
            Image("logoLaSalle")
                .resizable()
                .frame(width: 300, height: 100)
                .padding(5)
            
            Text("Ingeniería en Tecnologías de la Información y Telecomunicaciones")
                .font(.title)
                .padding()
                .multilineTextAlignment(.center)
                .foregroundColor(.blue)
            
            LottieView(animation: .named("animation"))
                .playing(loopMode: .loop)
            
            if noMasCategorias {
                Text("Ya no hay más categorías.")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.blue)
            } else if let materia = materiaSeleccionada {
                Text("Categoría seleccionada: ")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.blue)
                Text("\(materia)")
                    .font(.headline)
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.blue)
            } else {
                Text("Agite para seleccionar una categoría.")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.blue)
            }
        }
        .onShake {
            if let materia = viewModel.getMateria() {
                materiaSeleccionada = materia
                print("Categoría eliminada: \(materia)")
            } else {
                noMasCategorias = true
                print("Ya no hay más categorías.")
            }
        }
    }
}

struct ShakeView_Previews: PreviewProvider {
    static var previews: some View {
        ShakeView()
    }
}

