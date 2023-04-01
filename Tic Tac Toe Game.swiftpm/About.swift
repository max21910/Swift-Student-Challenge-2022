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
        
            
            VStack {
                Howtoplay()
                
                Link(destination: URL(string: "https://github.com/max21910")!,
                     label: {
                    Label (
                        title: {
                            Text("Github")
                                .bold()
                        },
                        icon: {
                            Image("GithubIcon")
                                .resizable()
                                .frame(width: 30, height: 30)
                            
                        }
                        
                    )
                    .frame(width: 250,
                           height: 50,
                           alignment: .center)
                    .background(Color.black)
                    .frame(width: 251,
                           height: 55,
                           alignment: .center)
                                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                })
                
                
                
                
                
                Link(destination: URL(string: "https://www.instagram.com/max_dpj/")!,
                     label: {
                    Label (
                        title: {
                            Text("Intagram")
                                .bold()
                                .foregroundColor(Color.white)
                        },
                        icon: {
                            Image("InstagramIcon")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .aspectRatio(contentMode: .fit)
                            
                            
                            
                        })
                    .background(
                        Image("Background")
                            .resizable()
                        
                            .frame(width: 250, height:50,
                                   alignment: .center)
                            .background(Color.black)
                            .foregroundColor(Color.white)
                        
                            .cornerRadius(20)
                        
                        
                    )
                    .padding()
                })
                
                
                Link(destination: URL(string: "https://twitter.com/max21160")!,
                     label: {
                    Label (
                        title: {
                            Text("Twitter")
                                .bold()
                        },
                        icon: {
                            Image("TwitterIcon")
                                .resizable()
                                .frame(width: 25, height: 20)
                            
                            
                        })
                    .frame(width: 250,
                           height: 50,
                           alignment: .center)
                    
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
                    
                })
                
                .padding(10)
                VStack {
                    Text( "V1.0 Made with ❤️ by Max21910 in 🇫🇷For The Swift Chalenge 2023")
                        .padding(10)
                  
                        Text("Frameworks use in this project :")
                            .frame(alignment: .leading)
                        
                            .font(.title)
                      
                
                    
                    Link(destination: URL(string: "https://github.com/simibac/ConfettiSwiftUI")!,
                         label: {
                        Label (
                            title: {
                                Text("confetti animation")
                                    .bold()
                            },
           
                            icon: {
                                Image("GithubIcon")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                            }
                            
                        )
                        .frame(width: 250,
                               height: 50,
                               alignment: .center)
                        .background(Color.black)
                        .frame(width: 251,
                               height: 55,
                               alignment: .center)
                                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                    })
                    Link(destination: URL(string: "https://github.com/MAJKFL/Welcome-Sheet")!,
                         label: {
                        Label (
                            title: {
                                Text("WelcomeSheet")
                                    .bold()
                            },
           
                            icon: {
                                Image("GithubIcon")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                            }
                            
                        )
                        .frame(width: 250,
                               height: 50,
                               alignment: .center)
                        .background(Color.black)
                        .frame(width: 251,
                               height: 55,
                               alignment: .center)
                                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                    })
                    
                    
                    
                    
                }
            }
            .navigationTitle("About")
        }
    }
}


struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
