//
//  NetworkManager.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 19.06.2022.
//

import Combine
import Foundation

class NetworkManager: ObservableObject {
    @Published var maybelline = [Maybelline]()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description error")
                return
            }
            do{
                let maybs = try JSONDecoder().decode([Maybelline].self, from: data)
                DispatchQueue.main.async {
                    self.maybelline = maybs
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
