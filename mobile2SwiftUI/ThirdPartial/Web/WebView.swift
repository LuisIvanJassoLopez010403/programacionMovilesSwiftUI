//
//  WebView.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 07/05/25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

struct WebPageView: View {
    var body: some View {
        NavigationView {
            VStack {
                WebView(url: URL(string: "https://apple.com")!)
                    .navigationTitle("Apple")
                    .navigationBarTitleDisplayMode(.inline)
                
                WebView(url: URL(string: "https://www.ulsachihuahua.edu.mx")!)
                    .navigationTitle("ULSA")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
