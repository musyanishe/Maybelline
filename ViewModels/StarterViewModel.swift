//
//  StarterViewModel.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 23.06.2022.
//

import Foundation

class StarterViewModel:  {
    
  
    func getFilteredProductType() -> [String] {
        let productType = [mayb.productType]
        var filteredPT: [String] = []
        for filterpt in productType {
            if filteredPT.contains(filterpt) {
                filteredPT.append(filterpt)
            }
        }
        return filteredPT
    }
    
}
