//
//  SplashScreen.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 17.07.2022.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        
        ZStack {
            Color.theme.background
            
            Group{
                //Custom Shape with Animation
                SplashShape()
//                    .trim(from: 0, to: 0.2)
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
            }
            //Default frame
            .frame(width: 300, height: 230)
        }
        .ignoresSafeArea()
    }
}

struct SplashShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            let mid = rect.width / 2
            let height = rect.height
            let width = rect.width
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width - 270, y: height))
            
            path.move(to: CGPoint(x: width - 20, y: 0))
            
            path.addArc(center: CGPoint(x: width, y: 0), radius: 20, startAngle: .init(degrees: 180), endAngle: .zero, clockwise: false)
            
            //straight line
            path.move(to: CGPoint(x: width - 20, y: 0))
            path.addLine(to: CGPoint(x: mid + 60, y: height))
            
            //rounded path
            path.move(to: CGPoint(x: mid - 20, y: height))
            path.addArc(center: CGPoint(x: mid + 20, y: height), radius: 40, startAngle: .init(degrees: 180), endAngle: .zero, clockwise: true)
            
            //straight line
            path.move(to: CGPoint(x: mid - 20, y: height))
            path.addLine(to: CGPoint(x: mid - 10, y: height - 150))
            
//            path.move(to: CGPoint(x: <#T##CGFloat#>, y: <#T##CGFloat#>))
            

        }
    }
    
    
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
