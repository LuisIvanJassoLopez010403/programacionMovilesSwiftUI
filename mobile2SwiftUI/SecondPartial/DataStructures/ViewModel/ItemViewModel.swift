//
//  ItemViewModel.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 19/03/25.
//

import Foundation


class ItemViewModel: ObservableObject {
    @Published var items: [ItemModel] = [
        ItemModel(name: "iPhone", description: "Apple Smartphone"),
        ItemModel(name: "iPad", description: "Apple Tablet"),
        ItemModel(name: "MacBook", description: "Apple Laptop")
    ]
    
    func refreshData() {
        let newItems = [
            ItemModel(name: "Airpods", description: "Apple Earphones"),
            ItemModel(name: "Apple Watch", description: "Apple Smart Watch")
        ]
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.items = newItems
        }
    }
}


