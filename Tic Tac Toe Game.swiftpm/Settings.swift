//
//  Settings.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 01/04/2023.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView{
            
            Howtoplay()

           
        }
        .navigationTitle("Settings")
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
