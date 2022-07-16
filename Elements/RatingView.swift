//
//  RatingView.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 13.07.2022.
//

import SwiftUI

struct RatingView: View {
    var rating: Double
    
    var body: some View {
        HStack(spacing: 5) {
            Spacer()
            ForEach(1...5, id: \.self) { index in
                Image(systemName: "star.fill")
                    .font(.system(size: 8))
                    .foregroundColor(Color.theme.secondaryText.opacity(index > Int(rating) ? 0.2 : 1))
            }
            Text(String(format: "%.1f", rating))
                .foregroundColor(Color.theme.secondaryText)
                .font(Font.headline.bold())
                .padding(.trailing, 10)
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            RatingView(rating: 3.0)
                .previewLayout(.sizeThatFits)
            
            RatingView(rating: 3.5)
                .previewLayout(.sizeThatFits)
                .colorScheme(.dark)
            
        }
    }
}
