//
//  ListExampleView.swift
//  mobile2SwiftUI
//
//  Created by ITIT on 19/03/25.
//

import SwiftUI

struct ListExampleView: View {
    
    @StateObject private var viewModel = ItemViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.items) { item in
                NavigationLink(destination:
                    DetailListExampleView(item: item)) {
                    Text(item.name)
                }
            }
            .navigationTitle("Apple Products")
            .refreshable {
                viewModel.refreshData()
            }
        }
    }
}

#Preview {
    ListExampleView()
}
