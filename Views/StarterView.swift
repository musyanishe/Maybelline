//
//  ContentView.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 19.06.2022.
//

import SwiftUI

struct StarterView: View {
//    @EnvironmentObject var starterViewModel: StarterViewModel
    @StateObject var getMaybellineData = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(getMaybellineData.maybelline) { mayb in
                Text(mayb.productType)
            }
            .navigationBarTitle("Product Type")
        }
    }
}
    



struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
