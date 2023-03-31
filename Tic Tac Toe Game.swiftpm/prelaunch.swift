/*
prelaunch.swift
Emojie Speed Games
Created by Max  on 31/03/2023.
find this project on Github at :
*/
import SwiftUI

struct Prelaunch: View {
    @State private var animationisfinish = false
    @State private var angle: Double = 360
    @State private var opacity : Double = 1
    @State private var scale : CGFloat = 1
    
    var body: some View {
        Group {
            if animationisfinish == true {
   NavBar()
                
            } else {
                
                
                ZStack {
                    
                    Image("Blue")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    
                    Image("bigIcon")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .rotation3DEffect(
                            .degrees(angle),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                        .opacity(opacity)
                        .scaleEffect(scale)
                }
            }
        }
        
        .onAppear {
            withAnimation(Animation.linear(duration: 2)) {
                angle = 0
                scale = 3
                opacity = 0
            }
            withAnimation(.linear.delay(1.75)) {
                animationisfinish = true
            }
        }
    }
}


struct PrelaunchView_Previews: PreviewProvider {
    static var previews: some View {
        Prelaunch()
    }
}



