/*
 Made by Max 21910 for the swift challenge 2023
 This is the view that containe the game
 */

import SwiftUI
import ConfettiSwiftUI

struct ContentView: View {
    @State private var board = Array(repeating: Array(repeating: Player.none, count: 5), count: 5)
    @State private var currentPlayer = Player.x                  //--> Current characters
    @State private var winner: Player? = nil                     //--> Player is winner
    @AppStorage("counter1") var counter1: Int = 0              //--> Confetti animation
    @AppStorage("counter2") var counter2: Int = 0              //--> Confetti animation
    @AppStorage("counter3") var counter3: Int = 0              //--> Confetti animation
    @State private var ShowClock = false                         //--> Hde Clock
    @State private var ShouldAnimate = false                     //--> Show animation
    @State private var showAlert = false                         //--> Show Tie Alert
    @State private var ShowPlay = true
    @AppStorage("Coins1") var Coins: Int = 1000
    @ObservedObject var stopWatchManager = StopWatchLogic()
    @AppStorage("🖤 Background ") var black = false
    @AppStorage("❤️ Background") var red = false
    @AppStorage("blueon") var blueon = false
    @AppStorage("redon") var redon = false
    @AppStorage("blackon") var blackon = false
    @AppStorage("moneyanim ") var moneyanim = false
    @AppStorage("moneyanimon ") var moneyanimon = false
    @AppStorage("loveanim ") var loveanim = false
    @AppStorage("loveanimon ") var loveanimon = false
    @State private var noanimon = false


    
    
    //--> Define a variable to keep track of whether all the cases are filled
    private var allCasesFilled: Bool {
        for row in 0..<3 {
            for column in 0..<3 {
                if board[row][column] == .none {
                    return false
                }
            }
        }
        return true
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                if redon == false && blackon  == false {
                    Color.blue.ignoresSafeArea()
                }
                
                if blueon == true {
                    
                    Color.blue.ignoresSafeArea()
                    
                }
                if blackon == true {
                    
                    Color.black.ignoresSafeArea()
                    
                }else {
                    if redon == false {
                        Color.blue.ignoresSafeArea()
                    }
                }
                if redon == true {
                    
                    Color.red.ignoresSafeArea()
                }else {
                    if blackon == false {
                        Color.blue.ignoresSafeArea()
                    }
                }
                VStack() {
                    // Display the current player
                    if ShowPlay == false {
                        Text("🎮 \(currentPlayer.rawValue)'s turn")
                        
                            .frame(width: 250, height:50)
                            .foregroundColor(Color.green)
                            .cornerRadius(20)
                        
                        HStack{
                            
                            Image(systemName: "timer")
                                .foregroundColor(.yellow)
                                .frame(width: 30, height:70)
                            Text(String(format: "%.1f", stopWatchManager.secondsElapsed))
                                .foregroundColor(.yellow)
                                .font(.title)
                            
                            
                            
                        }
                    }
                    
                    
                    Spacer()
                    HStack {
                        NavigationLink(destination: ShopView()) {
                            Image(systemName: "dollarsign.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.yellow)
                            Text("\(Coins)")
                                .font(.headline)
                                .foregroundColor(.yellow)
                        }
                            NavigationLink(destination: CoinExplanationView()) {
                            Image(systemName: "info.circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                    }
                        
                        // Display the board
                        if ShowPlay == false {
                            VStack(spacing: 10) {
                                
                                ForEach(0..<3) { row in
                                    HStack(spacing: 10) {
                                        ForEach(0..<3) { column in
                                            Button(action: {
                                                
                                                guard winner == nil else { return }
                                                
                                                
                                                // Ignore the button press if the space is already occupied
                                                guard board[row][column] == .none else { return }
                                                
                                                // Set the space to the current player with animation
                                                withAnimation {
                                                    board[row][column] = currentPlayer
                                                }
                                                
                                                // Check for a winner
                                                if let newWinner = checkForWinner() {
                                                    winner = newWinner
                                                    self.stopWatchManager.pause()//stop chrono
                                                    print("winner game not tie")
                                                    
                                                    
                                                    if moneyanimon == true {
                                                        noanimon = false
                                                        loveanimon = false //avoid show to animation at one time
                                                        
                                                        counter2 += 1 //display the confetti
                                                    } else {
                                                        noanimon = true
                                                    }
                                                    
                                                    
                                                    
                                                    if loveanimon == true {
                                                        moneyanimon = false   //avoid show to animation at one time
                                                        noanimon = false
                                                        counter3 += 1
                                                    }else {
                                                        noanimon = true
                                                    }
                                                    
                                                    if noanimon == true {
                                                        counter1 += 1
                                                    }
                                                    
                                                    
                                                    Coins = Coins + 10 // add coins
                                                    
                                                    
                                                }else {
                                                    // Switch to the other player
                                                    currentPlayer = currentPlayer == .x ? .o : .x
                                                }
                                                
                                                // Check if all cases are filled
                                                if allCasesFilled  && winner == nil {
                                                    self.stopWatchManager.pause()//make sure to pause chrono
                                                    ShowPlay = true
                                                    showAlert = true  //show Tie alert
                                                    winner = nil
                                                    
                                                    
                                                    
                                                }
                                                
                                                
                                                
                                            }) {
                                                // Display the space with animation
                                                Rectangle()
                                                    .foregroundColor(.white)// color of the player
                                                    .frame(width: 80, height: 80)
                                                    .cornerRadius(10)
                                                    .overlay(
                                                        Text(board[row][column].rawValue)
                                                            .font(.system(size: 48))
                                                            .foregroundColor(.black)
                                                            .opacity(board[row][column] == .none ? 0 : 1)
                                                    )
                                                    .scaleEffect(board[row][column] == .none ? 0 : 1)
                                            }
                                        }
                                    }
                                }
                            }
                            
                            .padding(20)
                            .background(Color.white.opacity(0.7))
                            .cornerRadius(12)
                        }
                        
                        // Display the winner (if any, no Tie) with animation
                        if let winner = winner {
                            Text("Player \(winner.rawValue) wins! 👑")
                                .foregroundColor(.yellow)
                                .font(.largeTitle)
                                .opacity(ShouldAnimate ? 1 : 0)
                                .scaleEffect(ShouldAnimate ? 1.2 : 0.5)
                            Text("in \(String(format: "%.1f", stopWatchManager.secondsElapsed))sec ")
                                .foregroundColor(.yellow)
                                .font(.largeTitle)
                                .opacity(ShouldAnimate ? 1 : 0)
                                .scaleEffect(ShouldAnimate ? 1.2 : 0.5)
                            
                                .onAppear {
                                    self.ShouldAnimate = true
                                    ShowPlay = true
                                }
                            
                            
                        }
                        
                        if ShowPlay == true {
                            Button(action: {
                                
                                withAnimation {
                                    board = Array(repeating: Array(repeating: Player.none, count: 3), count: 3)
                                    ShowPlay = false
                                    winner = nil
                                    currentPlayer = .x
                                    //restore chrono to 0 and restart
                                    self.ShouldAnimate = false
                                    self.stopWatchManager.stop()//make sure to erease old chrono
                                    self.stopWatchManager.start()//start new chrono
                                    
                                    
                                }
                            }) {
                                Text("Play")
                                    .frame(width: 250,
                                           height: 50,
                                           alignment: .center)
                                    .background(Color.green)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(20)
                                
                            }
                            .transition(.opacity)
                            
                            .padding(100)
                        }
                        Howtoplay()
                    }
                    
                    
                    .alert("Game Over (Tie) in \(String(format: "%.1f", stopWatchManager.secondsElapsed))sec ", isPresented: $showAlert) {
                        Button("Restart Game", role: .cancel) {
                            // Reset the board and winner
                            withAnimation {
                                board = Array(repeating: Array(repeating: Player.none, count: 3), count: 3)
                                ShowPlay = false
                                winner = nil
                                currentPlayer = .x
                                //restore chrono to 0 and restart
                                self.ShouldAnimate = false
                                self.stopWatchManager.stop()//make sure to erease old chrono
                                self.stopWatchManager.start()//start new chrono
                                
                            }
                        }
                    }
                    
                }
                .navigationBarTitle("Tic Tac Toe")
            }
            
            
            .confettiCannon(counter: $counter1, repetitions: 3, repetitionInterval: 0.7)
            
            .confettiCannon(counter: $counter2, num:1, confettis: [.text("💵"), .text("💶"), .text("💷"), .text("💴")], confettiSize: 30, repetitions: 40, repetitionInterval: 0.1)
            
            .confettiCannon(counter: $counter3, confettis: [.text("❤️"), .text("💙"), .text("💚"), .text("🧡")])
            
            
        }
    
    // Function to check for a winner
    private func checkForWinner() -> Player? {
        // Check rows
        for row in 0..<3 {
            if board[row][0] != .none && board[row][0] == board[row][1] && board[row][1] == board[row][2] {
                return board[row][0]
                
            }
        }
        
        // Check columns
        for column in 0..<3 {
            if board[0][column] != .none && board[0][column] == board[1][column] && board[1][column] == board[2][column] {
                return board[0][column]
            }
        }
        
        // Check diagonals
        if board[0][0] != .none && board[0][0] == board[1][1] && board[1][1] == board[2][2] {
            return board[0][0]
        }
        if board[2][0] != .none && board[2][0] == board[1][1] && board[1][1] == board[0][2] {
            return board[2][0]
        }
        
        // No winner
        
        
        
        return nil
    }
    
}




// Enum to represent each player
enum Player: String {
    case x = "X"
    case o = "O"
    case none = ""
}

