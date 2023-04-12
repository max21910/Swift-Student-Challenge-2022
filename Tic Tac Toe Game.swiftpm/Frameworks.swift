//
//  Frameworks.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 05/04/2023.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
        
    }
    
}
struct ProductCard: View {
    
    var image: String
    var title: String
    var type: String
    var link: String
    
    var body: some View {
        
        HStack(alignment: .center) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Text(type)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(.gray)
                HStack {
                    Button(action: {
                        guard let url = URL(string: link) else { return }
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        Text("Github Link")
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .foregroundColor(.blue)
                        Image("GithubIcon")
                            .resizable()
                            .frame(width: 20,height: 20)
                            .padding(5)
                        
                    })
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .padding(.top, 8)
                }
            }.padding(.trailing, 20)
            Spacer()
        }
        .frame(width: 320,height: 100)
        .background(Color(red: 32/255, green: 36/255, blue: 38/255))
        .modifier(CardModifier())
        .padding(.all, 5)
        .cornerRadius(15)
    }
}

struct Frameworks: View {
    
    var body: some View {
        
        
        NavigationView {
            
            VStack{
                VStack{
                    
                    ProductCard(image: "confetti", title: "Confetti Swift UI",type: "Confetti Animation",link: "https://github.com/simibac/ConfettiSwiftUI")
                    
                    ProductCard(image: "WelcomeSheetBanner", title: "WelcomeSheet",type: "Welcome Sheet",link: "https://github.com/MAJKFL/Welcome-Sheet")
                    
                    ProductCard(image: "AlertToast", title: "AlertToast",type: "Alert Animation",link: "https://github.com/elai950/AlertToast")
                    ProductCard(image: "shiny", title: "Shiny",type: "Shiny Animated Text",link: "https://github.com/maustinstar/shiny")
                    
                }
                .frame(width: 360,height: 600)
                .background(Color(red: 32/255, green: 50/255, blue: 60/255))
                .modifier(CardModifier())
                .padding(.all, 5)
                .cornerRadius(15)
                
                
                
            }
            
            Spacer()
        }
        .navigationTitle("Frameworks")
    }
    
}

struct Frameworks_Previews: PreviewProvider {
    static var previews: some View {
        Frameworks()
    }
}
