//
//  UIAlertControllerWrapper.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 17/02/25.
//

import Foundation

import SwiftUI

struct UIAlertControllerWrapper: UIViewControllerRepresentable {
    var title: String
    var message: String
    @Binding var isPresented: Bool

    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController() // Empty controller to present the alert
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
                isPresented = false
            })

            DispatchQueue.main.async {
                uiViewController.present(alert, animated: true, completion: nil)
            }
        }
    }
}
