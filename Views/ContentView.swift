//
//  ContentView.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 19.06.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var getMaybellineData = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(getMaybellineData.maybelline) { mayb in
                Text(mayb.productType)
            }
            .navigationBarTitle("Product Type")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
