//
//  WaterTrackerView.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 26/03/25.
//

import SwiftUI

struct WaterTrackerView: View {
    @StateObject var viewModel = WaterTrackerViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Water Consumed:")
                .font(.title2)
                .bold()
            
            Text("\(viewModel.waterTotal) ml")
            
            HStack {
                Button(action: {
                    viewModel.water1 = true
                    viewModel.water2 = false
                    viewModel.water3 = false
                    viewModel.addWater()
                                    
                }) {
                    Image("water1")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(7)
                        .padding(5)
                        .background(Color.cyan)
                        .cornerRadius(10)
                }
                    
                Button(action: {
                    viewModel.water1 = false
                    viewModel.water2 = true
                    viewModel.water3 = false
                    viewModel.addWater()
                }) {
                    Image("water2")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(7)
                        .padding(5)
                        .background(Color.cyan)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    viewModel.water1 = false
                    viewModel.water2 = false
                    viewModel.water3 = true
                    viewModel.addWater()
                                    
                }) {
                    Image("water3")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(7)
                        .padding(5)
                        .background(Color.cyan)
                        .cornerRadius(10)
                }
                
            }
            HStack(spacing: 65) {
                Text("250 ml")
                Text("500 ml")
                Text("1000 ml")
            }
            .padding()
        }
        .onShake {
            viewModel.waterTotal = 0
        }
        .padding()
        .navigationTitle("Water Tracker") 
    }
}

// The notification we'll send when a shake gesture happens.
extension UIDevice {
    static let deviceDidShakeNotification = Notification.Name(rawValue: "deviceDidShakeNotification")
}

//  Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {
     open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
        }
     }
}

// A view modifier that detects shaking and calls a function of our choosing.
struct DeviceShakeViewModifier: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) { _ in
                action()
            }
    }
}

// A View extension to make the modifier easier to use.
extension View {
    func onShake(perform action: @escaping () -> Void) -> some View {
        self.modifier(DeviceShakeViewModifier(action: action))
    }
}
