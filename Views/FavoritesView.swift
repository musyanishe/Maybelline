//
//  FavoritesView.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 02.07.2022.
//

import SwiftUI

struct FavoritesView: View {
    
    @StateObject var viewModel = AllProductsViewModel()
    let detailsViewModel: DetailsViewModel
    
    var body: some View {
        
        if detailsViewModel.isFavorite {
//           R
        } else {
            Image(systemName: "heart.fill")
        }
        
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(detailsViewModel: DetailsViewModel(mayb: Maybelline.getHardInfo()))
    }
}
