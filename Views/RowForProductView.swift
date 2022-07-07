//
//  AllProductsView.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 02.07.2022.
//

import SwiftUI

struct RowForProductView: View {
    @StateObject var viewModel: DetailsViewModel
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
                ZStack{
                        TabView {
                            Rectangle()
                                .frame(width: 300, height: 600)
                                .cornerRadius(20)
                                .foregroundColor(Color.theme.elementColor)
                                .shadow(radius: 20)
                           
                        }
                        .tabViewStyle(.page(indexDisplayMode: .always))
                        
                VStack(spacing: 15) {
                    getImage(from: viewModel.imageData)
                        .resizable()
                        .frame(width: imageSize.width, height: imageSize.height)
                        .cornerRadius(cornerRadius)
                    
                    Rectangle()
                        .frame(width: 300, height: 3)
                        .foregroundColor(Color.theme.background)
                        .shadow(color: Color.theme.background.opacity(0.65), radius: 10, x: 5, y: 5)
//                        .overlay(alignment: .top) {
//
//                            Rectangle()
//                                .fill(Color.theme.background.opacity(0.75))
//                                .frame(width: 300, height: 200)
//                                .rotation3DEffect(.init(degrees: -98), axis: (x: 1, y: 0, z: 0), anchor: .top, anchorZ: 0.5, perspective: 1)
//                        }
                    HStack{
                        Spacer()
                    Text("\(viewModel.rating)")
                        .multilineTextAlignment(.trailing)
                    }
                    
                    
                    Text(viewModel.name)
                        .frame(width: 280)
                        .foregroundColor(Color.theme.secondaryText)
                        
                }
                }
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
            viewModel: DetailsViewModel(mayb: Maybelline.getHardInfo()),
            imageData: Data(),
            imageSize: CGSize(width: 200, height: 200),
            cornerRadius: 20)
        
        
    }
}
