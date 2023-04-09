//
//  About.swift
//  Tic Tac Toe Game
//
//  Created by Max  on 31/03/2023.
//
import SwiftUI

struct AboutView: View {
    let instagramLink = "https://www.instagram.com/Maxime_dpj"
    let twitterLink = "https://twitter.com/max21160"
    let githubLink = "https://github.com/max21910"
    let url = URL(string: "https://github.com/max21910/Swift-Challenge2023")!
    @State private var Welcome = false
    @AppStorage("showanime") var showanime = true
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.black.ignoresSafeArea() //force the background to be black 
                VStack(spacing: 5) {
                    Image("bigIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .onAppear {
                          //  if showanime == true { //if this is the first time show the animation should be true
                                Welcome.toggle()
                           // }
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
                    NavigationLink(destination: Frameworks()) {
                        Text("Frameworks use in this project")
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                    }
                    .padding(10)
                    Button(action: {
                               let activityVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)
                               guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                                     let rootViewController = windowScene.windows.first?.rootViewController else {
                                   return
                               }
                               rootViewController.present(activityVC, animated: true, completion: nil)
                           }) {
                               VStack{
                                   Text("Version \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")")
                                       
                                       .padding(10)
                                   Text("Made by Max21910 in 🇫🇷 with ❤️")
                                       .foregroundColor(Color.white)
                                       .fontWeight(.bold)
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
                               .frame(width: 370,height: 140)
                               .background(Color(red: 32/255, green: 36/255, blue: 38/255))
                               .modifier(CardModifier())
                               .padding(.all, 5)
                               .cornerRadius(15)
                               
                               
                           }
                           
                }
            }
            .navigationTitle("About")
        }
        .toast(isPresenting: $Welcome, duration: 2) {
            
            // `.alert` is the default displayMode
            AlertToast(displayMode: .banner(.pop),type: .systemImage("person.line.dotted.person.fill", Color.blue), title: "Thanks for Use my App!", subTitle: "Maxime Jourdan - Developer")
        } completion: {
           //Completion block after dismiss
            showanime = false //make sure to show only 1 time the greeting animation
        }
    }
}


struct AboutView_Preview: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}

