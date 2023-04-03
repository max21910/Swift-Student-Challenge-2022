//
//  File.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 03/04/2023.
//
/*/
import SwiftUI
import ConfettiSwiftUI
struct animView: View {
    @AppStorage("🎉 Confetti") var confetti = true
    @AppStorage("💸 Money") var money = false
    @AppStorage("❤️ Love") var love = false
    @AppStorage("counter") var counter: Int = 0   //--> Confetti animation
    
    var body: some View {
        
        VStack {
            
            if confetti == true {
                .confettiCannon(counter: $counter, repetitions: 3, repetitionInterval: 0.7)
            }
            if money == true {
                .confettiCannon(counter: $counter, num:1, confettis: [.text("💵"), .text("💶"), .text("💷"), .text("💴")], confettiSize: 30, repetitions: 50, repetitionInterval: 0.1)
            }
            if love == true {
                .confettiCannon(counter: $counter, confettis: [.text("❤️"), .text("💙"), .text("💚"), .text("🧡")])
            }
        }
    }
}
    struct animView_Previews: PreviewProvider {
        static var previews: some View {
            animView()
        }
    }
 /**/*/
