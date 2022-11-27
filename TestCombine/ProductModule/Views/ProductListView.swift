//
//  ProductListView.swift
//  TestCombine
//
//  Created by abdelbaqy yassin on 21/11/2022.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var viewModel = ProductListViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.products.count == 0 {
                ProgressView()
                    .frame(width: 40, height: 40)
            } else {
                List {
                    ForEach(viewModel.products) { product in
                        ProductRow(model: product)
                    }
                }
            }
        }.navigationTitle(Text("Products"))
            .listStyle(.plain)
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
