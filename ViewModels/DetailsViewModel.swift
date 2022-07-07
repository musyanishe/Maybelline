//
//  DetailsViewModel.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 01.07.2022.
//

import Foundation

class DetailsViewModel: ObservableObject {
    
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
    
    var rating: String {
        String(format: "%.02f", mayb.rating)
    }
    
    private let mayb: Maybelline
    
    init(mayb: Maybelline) {
        self.mayb = mayb
    }
}
