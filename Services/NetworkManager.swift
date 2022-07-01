//
//  NetworkManager.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 19.06.2022.
//

import Combine
import Foundation

enum NetworkError {
    case noData
    case invalidURL
    case decodingError
}

class NetworkManager: {
    
    static let shared = NetworkManager()
    
    private init() {}
    
        //there is code for networking without async/await
        /*
         func fetchData() {
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
         */
        
    //there is code for networking with async/await
    func fetchMaybs async throws -> [Maybelline] {
        
        guard let url = URL(string: "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline") else { throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let maybs = JSONDecoder().decode([Maybelline].self, from: data) else {
            throw NetworkError.decodingError
        }
        return maybs
    }
    
    func fetchImageData(from url: String) throws -> Data {
        guard let imageURL = URL(string: url) else { throw NetworkError.invalidURL }
        guard let imageData = try? Data(contentsOf: imageURL) else { throw NetworkError.noData }
        return imageData
    }
        
}
