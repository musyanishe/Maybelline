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
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHGrid(rows: columns) {
                        ForEach(viewModel.productCarts, id: \.id) {
                            detailsViewModel in
                            GeometryReader { geometry in
                            RowForProductView(viewModel: detailsViewModel)
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX) / -20), axis: (x: 0, y: 10, z: 0))
                        }
                            .frame(width: 300, height: 700)
                        }
                        .padding(10)
                    }
                    .padding(.leading, 40)
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
