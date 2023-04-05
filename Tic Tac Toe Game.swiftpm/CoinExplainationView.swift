//
//  CoinExplainationView.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 04/04/2023.
//

import SwiftUI

struct CoinExplanationView: View {
    @State private var isCoinRotating = false
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Virtual Coins")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                Image(systemName: "dollarsign.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.yellow)
                    .rotationEffect(Angle.degrees(isCoinRotating ? 360 : 0))
               
.onAppear {
                        self.isCoinRotating = true
                    }
                
                Text("In Tic Tac Toe, virtual coins are used as a currency that can be earned by winning games. These coins can then be used to purchase animations and background colors in the item Shops.")
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                
                
                Spacer()
           
                
                
            }
        }
    }
}
struct CoinExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        CoinExplanationView()
    }
}
