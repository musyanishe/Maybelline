//
//  ProductView.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 23.06.2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductView: View {
    
    var url: String
    var rating: Double
    var description: String
    
    var body: some View {
        TabView {
            VStack{
                AnimatedImage(url: URL(string: url))
                    .resizable()
                    .frame(width: 300, height: 300)
                
                Text(String(rating))
                Text(description)
            }
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(
    url: "https://d3t32hsnjxo7q6.cloudfront.net/i/991799d3e70b8856686979f8ff6dcfe0_ra,w158,h184_pa,w158,h184.png",
    rating: 5.0,
    description: "tratata")
    }
}
