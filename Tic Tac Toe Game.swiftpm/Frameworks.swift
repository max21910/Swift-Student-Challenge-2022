//
//  Frameworks.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 05/04/2023.
//

import SwiftUI
import UIKit


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
                .frame(width: 50)
                .padding(.all, 20)
            
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
                        Image(systemName: "link.circle.fill")
                            .padding(5)
                        
                    })
                    
                    
                    
                    
                    
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding(.top, 8)
                }
            }.padding(.trailing, 20)
            Spacer()
        }
        .frame(width: 340,height: 100)
        .background(Color(red: 32/255, green: 36/255, blue: 38/255))
        .modifier(CardModifier())
        .padding(.all, 5)
        .cornerRadius(15)
    }
}

struct Frameworks: View {
    var body: some View {
        let url = URL(string: "https://github.com/max21910/Swift-Challenge2023")!
        NavigationView {
            VStack{
                VStack{
                    
                    ProductCard(image: "GithubIcon", title: "Confetti Swift UI",type: "Github Frameworks",link: "https://github.com/simibac/ConfettiSwiftUI")
                    
                    ProductCard(image: "GithubIcon", title: "WelcomeSheet",type: "Github Frameworks",link: "https://github.com/MAJKFL/Welcome-Sheet")
                    
                    ProductCard(image: "GithubIcon", title: "AlertToast",type: "Github Frameworks",link: "https://github.com/elai950/AlertToast")
                }
                .frame(width: 370,height: 370)
                .background(Color(red: 32/255, green: 50/255, blue: 60/255))
                .modifier(CardModifier())
                .padding(.all, 5)
                .cornerRadius(15)
                
                VStack{
                    Text("Version \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")")
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding(10)
                    Text("Made by Max21910 in 🇫🇷 with ❤️")
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding(10)
                    Button(action: {
                               let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
                               guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                     let rootViewController = windowScene.windows.first?.rootViewController else {
                                   return
                               }
                               rootViewController.present(activityVC, animated: true, completion: nil)
                           }) {
                               HStack{
                                   Image(systemName: "square.and.arrow.up")
                                   Text("Share this project")
                               }
                           }
                       }
                .frame(width: 370,height: 120)
                .background(Color(red: 32/255, green: 50/255, blue: 60/255))
                .modifier(CardModifier())
                .padding(.all, 5)
                .cornerRadius(15)
                
                
            }
          
            .navigationTitle("Frameworks")
        }
    }
}

struct Frameworks_Previews: PreviewProvider {
    static var previews: some View {
        Frameworks()
    }
}
