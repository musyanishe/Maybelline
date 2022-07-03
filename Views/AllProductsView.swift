//
//  AllProductsView.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 02.07.2022.
//

import SwiftUI

struct AllProductsView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("Maybelline on Well.ca")
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.medium)
                    .font(.title)
                Spacer()
                
                TabView {
                    Rectangle()
                    .frame(width: 300, height: 600)
                    .cornerRadius(20)
                    .foregroundColor(Color.theme.background)
                    .shadow(radius: 20)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
            }
        }
    }
}

struct AllProductsView_Previews: PreviewProvider {
    static var previews: some View {
        AllProductsView()
            .preferredColorScheme(.dark)
            
    }
}
