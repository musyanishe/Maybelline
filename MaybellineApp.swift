//
//  MaybellineApp.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 19.06.2022.
//

import SwiftUI

@main
struct MaybellineApp: App {
    
    @StateObject var starterViewModel: StarterViewModel = StarterViewModel()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
        }
        
    }
}
