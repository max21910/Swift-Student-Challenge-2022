//
//  CoinExplainationView.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 04/04/2023.
//

import SwiftUI


struct CoinExplanationView: View {
    @State private var CoinsAnimation = false
    let message = "In Tic Tac Toe, virtual coins are used as a currency that can be earned by winning games. These coins can then be used to purchase animations and background colors in the item Shops."
    @State private var displayedMessage = ""
    let impact = UIImpactFeedbackGenerator() //set vibration
    @AppStorage("vibration ") var vibration = true
    
    
    var body: some View {
        NavigationView{
            VStack {
                
                Text("Virtual Coins")
                    .font(.largeTitle)
                    .fontWeight(.bold).shiny(.iridescent)
                Image(systemName: "dollarsign.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50,height: 50)
                    .foregroundColor(.yellow)
                    .opacity(CoinsAnimation ? 0 : 0.3)
                    .scaleEffect(CoinsAnimation ? 2 : 1)
                    .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: CoinsAnimation)
                
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                            CoinsAnimation.toggle()
                            
                        }
                    }
                
                
                Text(displayedMessage)
                    .bold()
                    .fontWeight(.bold).shiny()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    .onAppear {
                        var timer: Timer?
                        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                            if displayedMessage.count < message.count {
                                displayedMessage += String(message[message.index(message.startIndex, offsetBy: displayedMessage.count)])
                            } else {
                                timer?.invalidate()
                                timer = nil
                            }
                        }
                    }
                
                Spacer()
                Text("Move your iphone to see magical effect :)")
                    .font(.caption)
                    .fontWeight(.bold).shiny(.iridescent)
            }
        }
    }
}



struct CoinExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        CoinExplanationView()
    }
}
