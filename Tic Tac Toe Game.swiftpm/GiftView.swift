//
//  GiftView.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 12/04/2023.
//

import SwiftUI

struct GiftView: View {
    @State private var canClaimGift: Bool = true
    @AppStorage("Coins1") var Coins: Int = 1000
    @State private var coinanimation = false
    @State private var logoRotation: Double = 0
    let impact = UIImpactFeedbackGenerator() //set vibration
    @AppStorage("vibration ") var vibration = true
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "dollarsign.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.yellow)
                        .padding(3)
                    
                    Text("\(Coins)")
                        .font(.headline)
                        .foregroundColor(.yellow)
                    
                    
                    Spacer()
                    
                }
                Spacer()
                if canClaimGift {
                    Button(action: {
                        if vibration == true {
                            impact.impactOccurred()
                        }
                        Coins = Coins + 50
                        coinanimation.toggle()
                        claimGift()
                    }) {
                        HStack{
                            Image(systemName: "gift.fill")
                                .padding()
                            Text("Claim Gift")
                                .bold()
                              
                            
                            
                        }
                        .frame(width: 170,height: 20)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                    }
                } else {
                    
                    HStack {
                        Image(systemName: "clock")
                            .rotationEffect(.degrees(logoRotation))
                            .animation(.linear(duration: 5).repeatForever(autoreverses: false), value: logoRotation)
                        
                            .onAppear {
                                withAnimation(Animation.linear(duration: 60).repeatForever(autoreverses: false)) {
                                    logoRotation = 360
                                }
                            }
                        
                        Text("Gift claimed, come back in 3 hours.")
                            .bold()
                            .padding()
                    }
                        Text("Note: every gift give you 50 coins")
                            .bold()
                    
                    
                    
                    .onAppear(perform: {
                        if let lastClaimed = UserDefaults.standard.object(forKey: "lastClaimed") as? Date {
                            let timeElapsed = Date().timeIntervalSince(lastClaimed)
                            canClaimGift = timeElapsed >= 10800
                        }
                    })
                    
                  
                }
                
            }
            .navigationTitle(" Gift")
        }
                .toast(isPresenting: $coinanimation){
                    AlertToast(displayMode: .hud,type: .systemImage("dollarsign.circle.fill", Color.yellow), title: "+50 coins !")
                    
                }
        }
    
            
            
            
            
            func claimGift() {
                // Perform action to claim the gift
                
                // Update the UI to show that the gift has been claimed
                canClaimGift = false
                
                // Save the current date/time to UserDefaults to track the last time the gift was claimed
                UserDefaults.standard.set(Date(), forKey: "lastClaimed3")
                
                // Start a timer to enable the button again after 3 hours
                Timer.scheduledTimer(withTimeInterval: 10800, repeats: false) { timer in
                    canClaimGift = true
                }
            }
        }
    

struct GiftView_Previews: PreviewProvider {
    static var previews: some View {
        GiftView()
    }
}
