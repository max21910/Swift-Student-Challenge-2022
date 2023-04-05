//
//  About.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 31/03/2023.
//
import SwiftUI
import AlertToast

    
    
struct About: View {
    let instagramLink = "https://www.instagram.com/Maxime_dpj"
    let twitterLink = "https://twitter.com/max21160"
    let githubLink = "https://github.com/max21910"
    @State private var Welcome = false
    
    var body: some View {
        
        NavigationView{
            
           
            ZStack {
                
                Color.black.ignoresSafeArea()
                VStack {
                    Image("bigIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .onAppear {
                            Welcome.toggle()
                        }
                    
                       
                    
                    
                    Text("Developer")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Maxime Jourdan")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    Text("maxime21160@icloud.com")
                        .font(.headline)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Button(action: {
                            guard let url = URL(string: instagramLink) else { return }
                            UIApplication.shared.open(url)
                        }) {
                            Image("InstagramIcon")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.pink)
                                .font(.system(size: 24))
                                .padding(10)
                            
                        }
                        
                        Button(action: {
                            guard let url = URL(string: twitterLink) else { return }
                            UIApplication.shared.open(url)
                        }) {
                            Image("TwitterIcon")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.blue)
                                .font(.system(size: 24))
                                .padding(10)
                        }
                        
                        Button(action: {
                            guard let url = URL(string: githubLink) else { return }
                            UIApplication.shared.open(url)
                        }) {
                            Image("GithubIcon")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.black)
                                .font(.system(size: 24))
                                .padding(10)
                        }
                    }
                }
            }
            .navigationTitle("About")
        }
        .toast(isPresenting: $Welcome) {
            
            // `.alert` is the default displayMode
            AlertToast(displayMode: .banner(.pop),type: .systemImage("person.line.dotted.person.fill", Color.blue), title: "Thanks for Use my App!", subTitle: "Maxime Jourdan - Developer")
        }
    }
}


struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}

