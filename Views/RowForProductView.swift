//
//  AllProductsView.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 02.07.2022.
//

import SwiftUI

struct RowForProductView: View {
    let maybelline: Maybelline
    let imageData: Data
    let imageSize: CGSize
    let cornerRadius: CGFloat
    
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
//                        getImage(from: viewModel.imageData)
//                            .resizable()
//                            .frame(width: imageSize.width, height: imageSize.height)
//                            .cornerRadius(cornerRadius)
                            
                        
                        Rectangle()
                            .frame(width: 300, height: 3)
                            .foregroundColor(Color.theme.background)
                            .shadow(color: Color.theme.background.opacity(0.65), radius: 10, x: 5, y: 5)
                        
                        
//                        HStack {
//                            Spacer()
//                            Text(viewModel.rating ?? "No rating yet")
//                                .multilineTextAlignment(.trailing)
//                                .foregroundColor(Color.theme.secondaryText)
//                                .font(Font.headline.bold())
//                        }
                        
//                        Text(viewModel.name)
//                            .frame(width: 280)
//                            .foregroundColor(Color.theme.secondaryText)
//                            .font(.headline)
//                        
//                        Text(viewModel.description)
//                            .multilineTextAlignment(.leading)
//                            .lineLimit(nil)
//                            .foregroundColor(Color.theme.secondaryText)
//                            .font(Font.body)
                           
                        Spacer()
                    }
                    .padding()
                    .frame(width: 300, height: 700)
                }
                Button("See more...") {
                    ()
                }
                .padding()
                .background(Color.theme.accent)
                .cornerRadius(40)
                .foregroundColor(Color.theme.secondaryText)
                .font(.body)
                
            }
        }
    }
    
    private func getImage(from data: Data) -> Image {
        guard let image = UIImage(data: data) else { return Image(systemName: "xmark.shield")}
        return Image(uiImage: image)
    }
    
}

struct RowForProductView_Previews: PreviewProvider {
    static var previews: some View {
        RowForProductView(
            maybelline: dev.maybelline,
            imageData: Data(),
            imageSize: CGSize(width: 200, height: 200),
            cornerRadius: 20)
        
        
        
        
        
        
        
        
    }
}
