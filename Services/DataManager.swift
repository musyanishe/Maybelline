//
//  DataManager.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 16.07.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private let userDefaults = UserDefaults()
    
    func saveFavoriteProduct(for name: String, with status: Bool) {
        userDefaults.set(status, forKey: name)
    }
    
    func loadFavoriteProduct(for name: String) -> Bool {
        userDefaults.bool(forKey: name)
    }
    
}
