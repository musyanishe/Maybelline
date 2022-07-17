//
//  DetailsViewModel.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 01.07.2022.
//

import Foundation

class DetailsViewModel: ObservableObject {
    
    var id: Int {
        mayb.id
    }
    
    var name: String {
        mayb.name
    }
    
    var imageData: Data {
        var imageData = Data()
        
        do {
            imageData = try NetworkManager.shared.fetchImageData(from: mayb.imageLink)
        } catch {
            print(error)
        }
        
        return imageData
        
    }
    
    var productLink: String {
        mayb.productLink
    }
    
    var description: String {
        mayb.description
    }
    
    var rating: Double {
        mayb.rating ?? 0
    }
    
    @Published var isFavorite: Bool {
        didSet {
            DataManager.shared.saveFavoriteProduct(for: mayb.name, with: isFavorite)
        }
    }
    
    private let mayb: Maybelline
    
    init(mayb: Maybelline) {
        self.mayb = mayb
        isFavorite = DataManager.shared.loadFavoriteProduct(for: mayb.name)
    }
    
    func favoriteButtonPressed() {
        isFavorite.toggle()
    }
    
}
