//
//  FrameworksView.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 05/04/2023.
//

import SwiftUI

struct FrameworksView: View {
    var body: some View {
      
        NavigationView {
            VStack {
               
    
                Text("Framework use :")
                    .font(.title)
                    .fontWeight(.bold)
                
                
                ProductCard(logo: "GithubIcon", titleBox: "Welcome-Sheet", type: "Github Frameworks ",link: "https://github.com/MAJKFL/Welcome-Sheet",imagebackground: "black")
                Button(action: {
                            guard let url = URL(string: "https://github.com") else { return }
                            UIApplication.shared.open(url)
                }) {
                    
                    Text("See on Github")
                        .foregroundColor(Color.white)
                }
                
                ProductCard(logo: "GithubIcon", titleBox: "ConfettiSwiftUI", type: "Github Frameworks ",link: "https://github.com/simibac/ConfettiSwiftUI",imagebackground: "black")
                            Button(action: {
                                        guard let url = URL(string: "https://github.com") else { return }
                                        UIApplication.shared.open(url)
                            }) {
                                
                                Text("See on Github")
                                    .foregroundColor(Color.white)
                            }
                
                
            }
        }
        .navigationTitle("Frameworks")
    }
       
}
        
        
        
       
    

struct CardModifier: ViewModifier {
func body(content: Content) -> some View {
    content
        .cornerRadius(18)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 0)
}

}

struct ProductCard: View {

var logo: String
var titleBox: String
var type: String
var link: String

var imagebackground: String


var body: some View {
    HStack(alignment: .center) {
        Image(logo)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40)
            .padding(.all, 20)
        
        VStack(alignment: .leading) {
            Text(titleBox)
                .font(.system(size: 23, weight: .bold, design: .default))
                .foregroundColor(.white)
            Text(type)
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(.gray)
            
            
            
        }
    }
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Image(imagebackground))
                .modifier(CardModifier())
                .padding(.all, 6)
        
}
}

struct FrameworksView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworksView()
    }
}
