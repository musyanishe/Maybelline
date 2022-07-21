//
//  ContentView.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 19.06.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        
        ZStack {
            
            Color.theme.background
                .ignoresSafeArea()
            
            VStack{
                
                Text("Maybelline on Well.ca")
                    .foregroundColor(Color.theme.accent)
                    .fontWeight(.medium)
                    .font(.title)
                
                HStack {
                    
                    Toggle(isOn: $isDarkMode) {
                        Text("Change theme")
                            .fontWeight(.medium)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(Color.theme.element)
                    .background(Color.theme.secondaryText)
                    .cornerRadius(20)
                    
                    
                }
                Spacer()
            }
        }
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
SettingsView()
    }
}

