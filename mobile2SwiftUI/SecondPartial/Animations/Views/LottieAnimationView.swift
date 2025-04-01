//
//  LottieAnimationView.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 20/03/25.
//

import SwiftUI
import Lottie

struct LottieAnimationView: View {
    var body: some View {
        VStack {
            LottieView(animation: .named("animation"))
                .playing(loopMode: .loop)
        }
    }
}

#Preview {
    LottieAnimationView()
}
