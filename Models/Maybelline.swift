//
//  Maybelline.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 19.06.2022.
//

import Foundation

struct Maybelline: Identifiable, Codable {
    let id: Int
    let name: String
    let imageLink: String
    let productLink: String
    let description: String
    let rating: Double?
    let productType: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case imageLink = "image_link"
        case productLink = "product_link"
        case description = "description"
        case rating = "rating"
        case productType = "product_type"
    }
}

extension Maybelline {
    static func getHardInfo() -> Maybelline {
        Maybelline(
            id: 495,
            name: "Maybelline Face Studio Master Hi-Light Light Booster Bronzer",
            imageLink: "https://d3t32hsnjxo7q6.cloudfront.net/i/991799d3e70b8856686979f8ff6dcfe0_ra,w158,h184_pa,w158,h184.png",
            productLink: "https://well.ca/products/maybelline-face-studio-master_88837.html",
            description: "Maybelline Face Studio Master Hi-Light Light Boosting bronzer formula has an expert \nbalance of shade + shimmer illuminator for natural glow. Skin goes \nsoft-lit with zero glitz.\n\n\t\tFor Best Results: Brush over all shades in palette and gently sweep over \ncheekbones, brow bones, and temples, or anywhere light naturally touches\n the face.\n\n\t\t\n\t\n\n",
            rating: 0,
            productType: "bronzer"
        )
    }
}
