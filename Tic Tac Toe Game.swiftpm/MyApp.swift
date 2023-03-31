import SwiftUI
import WelcomeSheet

@main
struct MyApp: App {
    @State private var showSheet = false
    
    let pages = [
        WelcomeSheetPage(title: "Welcome to Tic tac toe Game", rows: [
            WelcomeSheetPageRow(imageSystemName:"person.2.circle.fill",
                                accentColor: Color.mint,
                                title: "Created by Max21910",
                                content: "For the swift Challenge 2023"),
            
            WelcomeSheetPageRow(image: Image("GithubIcon"),
                                accentColor: Color.indigo,
                                title: "Open Source", content: "Find this project on github.com/max21910"),
            
            WelcomeSheetPageRow(imageSystemName: "ipad.and.iphone",
                                accentColor: Color.green,
                                title: "compatible to all platforms.",
                                content: "Written with 100% of Swift UI")
        ], accentColor: Color.purple, optionalButtonTitle: "Find this project in github", optionalButtonURL: URL(string: "https://github.com/max21910")),
        
        WelcomeSheetPage(title: "Instruction", rows: [
            WelcomeSheetPageRow(imageSystemName: "01.circle",
                                title: "",
                                content: "To play, simply tap on an empty square to place your mark. The game will automatically switch between X's and O's until a winner is declared or the game ends in a tie"),
            
            WelcomeSheetPageRow(imageSystemName:"02.circle",
                                title: "",
                                content: "The game is played on a 3x3 grid.Players take turns placing their mark (X or O) on an empty square."),
            
            WelcomeSheetPageRow(imageSystemName:"03.circle",
                                title: "",
                                content: "The first player to get 3 of their marks in a row (horizontally, vertically, or diagonally) wins.If all 9 squares are filled and no player has won, the game ends in a tie.")
        ], mainButtonTitle: "Lets Play !")
    ]
    
    var body: some Scene {
        WindowGroup {
            VStack {
                Prelaunch()
                    .onAppear {
                        showSheet.toggle()
                    }
                    
                    }
                
            HowtoplayMainView()
            }
        }
    }


struct HowtoplayMainView: View {
    @State private var showSheet = false
    
    let pages = [
        WelcomeSheetPage(title: "Welcome to Tic tac toe Game", rows: [
            WelcomeSheetPageRow(imageSystemName:"person.2.circle.fill",
                                accentColor: Color.mint,
                                title: "Created by Max21910",
                                content: "For the swift Challenge 2023"),
            
            WelcomeSheetPageRow(image: Image("GithubIcon"),
                                accentColor: Color.indigo,
                                title: "Open Source", content: "Find this project on github.com/max21910"),
            
            WelcomeSheetPageRow(imageSystemName: "ipad.and.iphone",
                                accentColor: Color.green,
                                title: "compatible to all platforms.",
                                content: "Written with 100% of Swift UI")
        ], accentColor: Color.purple, optionalButtonTitle: "Find this project in github", optionalButtonURL: URL(string: "https://github.com/max21910")),
        
        WelcomeSheetPage(title: "Instruction", rows: [
            WelcomeSheetPageRow(imageSystemName: "01.circle",
                                title: "",
                                content: "To play, simply tap on an empty square to place your mark. The game will automatically switch between X's and O's until a winner is declared or the game ends in a tie"),
            
            WelcomeSheetPageRow(imageSystemName:"02.circle",
                                title: "",
                                content: "The game is played on a 3x3 grid.Players take turns placing their mark (X or O) on an empty square."),
            
            WelcomeSheetPageRow(imageSystemName:"03.circle",
                                title: "",
                                content: "The first player to get 3 of their marks in a row (horizontally, vertically, or diagonally) wins.If all 9 squares are filled and no player has won, the game ends in a tie.")
        ], mainButtonTitle: "Lets Play !")
    ]
    
    var body: some View {
        
        Button(action: {
            showSheet.toggle()
        }, label: {
            Text("See instruction")
        })
        
        
      
        
        .welcomeSheet(isPresented: $showSheet,
                      onDismiss: { /* Run this code when sheet is dismissed */ },
                      isSlideToDismissDisabled: true,
                    
                      pages: pages)

    }
}
