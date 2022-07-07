//
//  Extension+Color.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 03.07.2022.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let secondaryText = Color("SecondaryText")
    let elementColor = Color("ElementColor")
    
}
