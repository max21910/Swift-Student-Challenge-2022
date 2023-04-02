//
//  chronoView.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 02/04/2023.
//

import SwiftUI

struct chronoView: View {
    @ObservedObject var stopWatchManager = StopWatchLogic()
    
    var body: some View {
        VStack {
            
            
            HStack{
                Image("chrono")
                    .resizable()
                    .frame(width: 100,height: 50)
                    .padding(.top, 100)
               
                Text(String(format: "%.1f", stopWatchManager.secondsElapsed))
                    .font(.custom("Avenir", size: 40))
                    .padding(.top, 200)
                    .padding(.bottom, 100)
                    .padding(.trailing, 100)
                    .padding(.leading, 100)
                
            }
            
            
            
            if stopWatchManager.mode == .stopped {
                Button(action: {self.stopWatchManager.start()}) {
                    TimerButton(label: "Start", buttonColor: .yellow, textColor: .black)
                }
            }
            if stopWatchManager.mode == .running {
                Button(action: {self.stopWatchManager.pause()}) {
                    TimerButton(label: "Pause", buttonColor: .yellow, textColor: .black)
                }
            }
            if stopWatchManager.mode == .paused {
                Button(action: {self.stopWatchManager.start()}) {
                    TimerButton(label: "Start", buttonColor: .yellow, textColor: .black)
                }
                Button(action: {self.stopWatchManager.stop()}) {
                    TimerButton(label: "Stop", buttonColor: .red, textColor: .white)
                }
                .padding(.top, 30)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TimerButton: View {
    
    let label: String
    let buttonColor: Color
    let textColor: Color
    
    var body: some View {
        Text(label)
            .foregroundColor(textColor)
            .padding(.vertical, 20)
            .padding(.horizontal, 90)
            .background(buttonColor)
            .cornerRadius(10)
    }
}

struct chronoView_Previews: PreviewProvider {
    static var previews: some View {
        chronoView()
    }
}
