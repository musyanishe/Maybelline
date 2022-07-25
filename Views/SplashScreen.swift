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
                    .stroke(Color.black, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                
            }
            .frame(width: 300, height: 230)
            .scaleEffect(endAnimation ? 0.15 : 1)
            
            Image("owl")
                .resizable()
                .padding(.top, 60)
                .frame(width: 130, height: 180)
                .scaleEffect(endAnimation ? 0.15 : 1)
                
            VStack {
                Text("Powered by")
                    .font(.callout)
                    .fontWeight(.semibold)
                
                Text("Crazy owl musyanishe")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .foregroundColor(Color.black.opacity(0.8))
            .padding(.bottom, getSafeArea().bottom == 0 ? 15 : getSafeArea().bottom)
            .opacity(startAnimation ? 1 : 0)
            .opacity(endAnimation ? 0 : 1)
            
        }
        .offset(y: endAnimation ? (-getRect().height * 1.5) : 0)
        .ignoresSafeArea()
        .onAppear {

            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1.1, blendDuration: 0.5).delay(0.3)) {
                startAnimation.toggle()
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

            path.move(to: CGPoint(x: mid - 150, y: mid))
            path.addArc(center: CGPoint(x: mid, y: mid), radius: 150, startAngle: .init(degrees: 180), endAngle: .init(degrees: (160)), clockwise: false)
            
            path.move(to: CGPoint(x: mid - 150, y: mid))
            path.addArc(center: CGPoint(x: mid, y: mid), radius: 100, startAngle: .init(degrees: 180), endAngle: .init(degrees: 150), clockwise: false)
        
            path.move(to: CGPoint(x: mid - 90, y: mid + 45))
            path.addLine(to: CGPoint(x: mid - 140, y: mid + 45))

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
