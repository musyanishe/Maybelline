//
//  ContentView.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 02.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var endAnimation: Bool = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        ZStack {
            
            TabView {
                AllProductsView()
                    .tabItem {
                        Image("29")
                        Text("Home")
                    }
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
            }
            
            SplashScreen(endAnimation: $endAnimation)
        }
        .environment(\.colorScheme, isDarkMode ? .dark : .light)
//        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
