//
//  AuthenticationViewModel.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 03/04/25.
//

import LocalAuthentication
import SwiftUI

class AuthenticationViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var errorMessage: String?

    func authenticateWithFaceID() {
        let context = LAContext()
        var error: NSError?

        // Check if Face ID is available
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate using Face ID."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authError in
                DispatchQueue.main.async {
                    if success {
                        self.isAuthenticated = true
                    } else {
                        self.errorMessage = authError?.localizedDescription ?? "Failed to authenticate."
                        self.isAuthenticated = false
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                self.errorMessage = "Face ID not available: \(error?.localizedDescription ?? "Unknown error.")"
            }
        }
    }
}
