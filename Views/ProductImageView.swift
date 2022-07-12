//
//  ProductImageView.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 12.07.2022.
//

import SwiftUI

struct ProductImageView: View {
    let imageData: Data
    let imageSize: CGSize
    
    var body: some View {
        getImage(from: imageData)
            .resizable()
            .frame(width: imageSize.width, height: imageSize.height)
            .cornerRadius(20)
    }
    
    private func getImage(from data: Data) -> Image {
        guard let image = UIImage(data: data) else {
            return Image(systemName: "xmark.shield")
        }
        return Image(uiImage: image)
    }
}

struct ProductImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProductImageView(
            imageData: Data(),
            imageSize: CGSize(width: 200, height: 200)
        )
        .previewLayout(.sizeThatFits)
    }
}
