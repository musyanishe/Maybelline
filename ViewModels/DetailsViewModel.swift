//
//  DetailsViewModel.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 01.07.2022.
//

import Foundation
import UIKit

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
    
//    @Published var shareButton: Bool
    
    private let mayb: Maybelline
    
    init(mayb: Maybelline) {
        self.mayb = mayb
        isFavorite = DataManager.shared.loadFavoriteProduct(for: mayb.name)
//        shareButton = false
    }
    
    func favoriteButtonPressed() {
        isFavorite.toggle()
    }
    
//    func shareButtonPressed() {
//        shareButton.toggle()
//
//        let url = URL(string: productLink)
//        let av = UIActivityViewController(activityItems: [url ?? ""], applicationActivities: nil)
//
//        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
//    }
    
}
