//
//  NavBar.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 31/03/2023.
//
import SwiftUI

struct NavBar: View {
    var body: some View {
        TabView {                //navbar
            ContentView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                        .resizable()
                        .frame(width: 100, height: 50)
                    Text("Play")
                }
          
                
        About()
                .tabItem {
                    Image(systemName: "info.circle")
                    Text("About")
                }
        }
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar()
    }
}

