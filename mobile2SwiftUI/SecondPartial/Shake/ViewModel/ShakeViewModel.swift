//
//  ShakeViewModel.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 01/04/25.
//
import Foundation
import SwiftUI

class ShakeViewModel: ObservableObject {
    @Published var materias = [
        "Diseño de Programas",
        "Lenguajes de Programación",
        "Sistemas Operativos",
        "Redes",
        "Ingeniería de Software",
        "Aplicaciones Móviles",
        "Programación Gráfica",
        "Inteligencia Artificial",
        "Bases de datos, Big Data, Inteligencia de Negocios",
        "Seguridad en redes y tecnologías de información",
        "Programación para Internet"
    ]
    
    func getMateria() -> String? {
        guard !materias.isEmpty else { return nil }
        
        let randomIndex = Int.random(in: 0..<materias.count)
        let materiaSeleccionada = materias[randomIndex]
        
        materias.remove(at: randomIndex)
        
        return materiaSeleccionada
    }
}

