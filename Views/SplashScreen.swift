//
//  SplashScreen.swift
//  Maybelline
//
//  Created by Евгения Шевцова on 17.07.2022.
//

import SwiftUI

struct SplashScreen: View {
    
    @State private var startAnimation: Bool = false
    @State private var circleAnimation: Bool = false
    
    @Binding var endAnimation: Bool
    
    var body: some View {
        
        ZStack {
            Color.theme.background
            
            Group{
                SplashShape()
                    .trim(from: 0, to: startAnimation ? 1 : 0)
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                
                Circle()
                    .fill(.white)
                    .frame(width: 35, height: 35)
                    .scaleEffect(circleAnimation ? 1 : 0)
                    .offset(x: 100, y: 140)
            }
            .frame(width: 300, height: 230)
            .scaleEffect(endAnimation ? 0.15 : 1)
            .rotationEffect(.init(degrees: endAnimation ? -90 : 0))
        }
        .offset(y: endAnimation ? (-getRect().height * 1.5) : 0)
        .ignoresSafeArea()
        .onAppear {
            
            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1.1, blendDuration: 0.5).delay(0.3)) {
                startAnimation.toggle()
            }
            
            withAnimation(.spring(response: 0.7, dampingFraction: 0.9, blendDuration: 1).delay(0.5)) {
                circleAnimation.toggle()
            }
            
            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1.1, blendDuration: 0.5).delay(1.5)) {
                endAnimation.toggle()
            }
            
        }
    }
}

struct SplashShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            let mid = rect.width / 2
            let height = rect.height
            let width = rect.width
            
            path.move(to: CGPoint(x: width - 310, y: height - 170))
            path.addLine(to: CGPoint(x: width - 280, y: height))
            
            path.move(to: CGPoint(x: width - 280, y: height))
            path.addArc(center: CGPoint(x: width - 240, y: height), radius: 40, startAngle: .init(degrees: 180), endAngle: .init(degrees: 15), clockwise: true)
            
            path.move(to: CGPoint(x: width - 200, y: height + 10))
            path.addLine(to: CGPoint(x: mid + 10, y: height - 150))
            
            path.move(to: CGPoint(x: mid + 10, y: height - 150))
            path.addArc(center: CGPoint(x: mid, y: height - 150), radius: 10, startAngle: .init(degrees: 180), endAngle: .zero, clockwise: false)
            
            path.move(to: CGPoint(x: mid - 20, y: height))
            path.addLine(to: CGPoint(x: mid - 10, y: height - 150))
        
            path.move(to: CGPoint(x: mid - 20, y: height))
            path.addArc(center: CGPoint(x: mid + 20, y: height), radius: 40, startAngle: .init(degrees: 180), endAngle: .init(degrees: 15), clockwise: true)
            
            path.move(to: CGPoint(x: mid + 60, y: height + 5))
            path.addLine(to: CGPoint(x: width - 20, y: 0))
            
            path.move(to: CGPoint(x: width - 20, y: 0))
            path.addArc(center: CGPoint(x: width, y: 0), radius: 20, startAngle: .init(degrees: 200), endAngle: .zero, clockwise: false)

        }
    }
}

extension View {
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getSafeArea() -> UIEdgeInsets {
        
        guard let screen =
                UIApplication.shared.connectedScenes.first as?
                UIWindowScene else { return .zero }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets
        else { return .zero }
        
        return safeArea
    }
    
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
