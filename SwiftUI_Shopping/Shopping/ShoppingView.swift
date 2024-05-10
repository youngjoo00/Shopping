//
//  ShoppingView.swift
//  SwiftUI_Shopping
//
//  Created by youngjoo on 5/10/24.
//

import SwiftUI

struct ShoppingView: View {
    
    private var columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    @StateObject
    private var viewModel = ShoppingViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.output.searchItems, id: \.productId) { item in
                        rowView(data: item)
                    }
                }
            } // ScrollView
            .task {
                viewModel.input.viewOnAppear.send(())
            } // ScrollView
        } // NavigationStack
    }
}

#Preview {
    ShoppingView()
}
