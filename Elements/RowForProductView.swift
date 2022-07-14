//
//  AllProductsView.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 02.07.2022.
//

import SwiftUI

struct RowForProductView: View {
    @StateObject var viewModel: DetailsViewModel
    
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
                
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 700)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .shadow(radius: 20)
                    
                    VStack {
                        ProductImageView(
                            imageData: viewModel.imageData,
                            imageSize: CGSize(width: 200, height: 200)
                        )
                            
                        
                        Rectangle()
                            .frame(width: 300, height: 3)
                            .foregroundColor(Color.theme.background)
                            .shadow(color: Color.theme.background.opacity(0.65), radius: 10, x: 5, y: 5)
                        
                        
                        RatingView(rating: viewModel.rating)
                        
                        Text(viewModel.name)
                            .frame(width: 280)
                            .foregroundColor(Color.theme.secondaryText)
                            .font(.headline)
                        
                        Text(viewModel.description)
                            .lineLimit(nil)
                            .foregroundColor(Color.theme.secondaryText)
                            .font(Font.body)
                            .padding()
                           
                        Spacer()
                    }
                    .frame(width: 300, height: 700)
                }
                
                Button ("See more...") {
                    if let url = URL(string: viewModel.productLink) {
                        UIApplication.shared.open(url)
                    }
                }
                .padding()
                .background(Color.theme.accent)
                .cornerRadius(40)
                .foregroundColor(Color.theme.element)
                .font(.body)
            }
        }
    }
}

struct FavoriteButton: View {
    var isFavorite: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(isFavorite ? .red : .gray)
        }
    }
}

struct RowForProductView_Previews: PreviewProvider {
    static var previews: some View {
        RowForProductView(
            viewModel: DetailsViewModel(mayb: Maybelline.getHardInfo()))
    }
}
