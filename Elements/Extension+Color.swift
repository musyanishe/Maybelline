//
//  Extension+Color.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 16.07.2022.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let element = Color("ElementColor")
    let secondaryText = Color("SecondaryText")
    
}
