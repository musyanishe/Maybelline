//
//  ContentView.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 02.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var endAnimation: Bool = false
    
    var body: some View {
        ZStack {
        TabView {
            StarterView()
                .tabItem {
                    Image("29")
                    Text("Home")
                }
            AllProductsView()
                .tabItem {
                    Image(systemName: "circle.grid.3x3.circle")
                    Text("All products")
                }
//            FavoritesView()
//                .tabItem {
//                    Image(systemName: "suit.heart")
//                    Text("Favorites")
//                }
        }
            
            SplashScreen(endAnimation: $endAnimation)
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
