//
//  AllProductsViewModel.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 12.07.2022.
//

import SwiftUI

class AllProductsViewModel: ObservableObject {
    @Published var productCarts: [DetailsViewModel] = []
    
    func fetchMaybsProducts() async {
        do {
            let carts = try await NetworkManager.shared.fetchMaybs()
            productCarts = carts.map { DetailsViewModel(mayb: $0) }
        } catch {
            print(error)
        }
    }
}
