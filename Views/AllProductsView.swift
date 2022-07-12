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
        TabView {
//            RowForProductView(viewModel: DetailsViewModel(mayb: Maybelline))
            }
        }
    
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        AllProductsView()
    }
}
