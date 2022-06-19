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
