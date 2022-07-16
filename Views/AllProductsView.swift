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
                
                let columns = [GridItem(.fixed(700), spacing: 30)]
                ScrollView(.horizontal){
                    LazyHGrid(rows: columns) {
                        ForEach(viewModel.productCarts, id: \.id) {
                            detailsViewModel in
                            RowForProductView(viewModel: detailsViewModel)
                        }
                        .padding(10)
                    }
                    .padding(.leading, 60)
                }
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
