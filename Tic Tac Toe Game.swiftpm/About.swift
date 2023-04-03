//
//  About.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 31/03/2023.
//
import SwiftUI
struct About: View {
    var body: some View {
        
        NavigationView {
            ZStack{
              
                VStack {
                    ProductCard(logo: "GithubIcon", titleBox: "Github", type: "Github",link: "https://github.com/max21910/Swift-Challenge2023",ButtonLabel: "link.circle.fill",imagebackground: "black")
                    
                    ProductCard(logo: "TwitterIcon", titleBox: "Twitter", type: "Twitter ",link: "https://twitter.com/Max_dpj",ButtonLabel: "link.circle.fill",imagebackground: "blue")
                    
                    ProductCard(logo: "InstagramIcon", titleBox: "Instagram", type: "Github Frameworks ",link: "https://instagram.com/Maxime_dpj",ButtonLabel: "link.circle.fill",imagebackground: "instagramBackground")
                    
                Text("Frameworks use :")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ProductCard(logo: "GithubIcon", titleBox: "Welcome-Sheet", type: "Github Frameworks ",link: "https://github.com/MAJKFL/Welcome-Sheet",ButtonLabel: "link.circle.fill",imagebackground: "black")
                    
                    ProductCard(logo: "GithubIcon", titleBox: "ConfettiSwiftUI", type: "Github Frameworks ",link: "https://github.com/simibac/ConfettiSwiftUI",ButtonLabel: "link.circle.fill",imagebackground: "black")
                }
              
                .navigationTitle("About")
            }
            
            
        }
        
        
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
    var ButtonLabel: String
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
                Link(destination: URL(string: link)!, label: {
                    Image(systemName: ButtonLabel)
                })
                
            }.padding(.trailing, 20)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Image(imagebackground))
        .modifier(CardModifier())
        .padding(.all, 6)
    }
}
struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
