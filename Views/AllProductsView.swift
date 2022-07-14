//
//  ProductView.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 23.06.2022.
//

import SwiftUI


struct AllProductsView: View {
    
    @StateObject var viewModel = AllProductsViewModel()
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("Maybelline on Well.ca")
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.medium)
                    .font(.title)
                
                
                TabView {
                    List(viewModel.productCarts, id: \.name) {
                        detailsViewModel in
                        RowForProductView(viewModel: detailsViewModel)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page)
                .task {
                    await viewModel.fetchMaybsProducts()
                }
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        AllProductsView()
    }
}
