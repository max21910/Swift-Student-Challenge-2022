import SwiftUI
import ConfettiSwiftUI
import WelcomeSheet

struct ContentView: View {
   
   // Define a two-dimensional array to represent the board
    @State private var board = Array(repeating: Array(repeating: Player.none, count: 5), count: 5)
    
    // Define a variable to keep track of the current player
    @State private var currentPlayer = Player.x
    
    // Define a variable to keep track of the winner (if any)
    @State private var winner: Player? = nil
    
    @State private var counter: Int = 0
    
    @State private var shouldAnimate = false
    
    
    @State private var  play = false //show or hide instruction if a game is played or not
    
    @AppStorage("coin") var coin: Int = 0 //store the coin value

  

    
  // Define a variable to keep track of whether all the cases are filled
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
    
    // Define a variable to keep track of whether to show the alert
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Display the current player
                if play == true {
                    Text("🎮 \(currentPlayer.rawValue)'s turn")
                    
                        .frame(width: 250, height:50)
                        .foregroundColor(Color.green)
                    
                        .cornerRadius(20)
                }
                HStack {
                    Image("coinimage")
                        .resizable()
                        .frame(width: 30,height: 20)
                    Text(String(coin))
                        .foregroundColor(Color.yellow)
                }
                
                // Display the board
                VStack(spacing: 10) {
                    
                    ForEach(0..<3) { row in
                        HStack(spacing: 10) {
                            ForEach(0..<3) { column in
                                Button(action: {
                                    // Ignore the button press if the game is already over
                                    guard winner == nil else { return }
                                    play = true
                                    
                                    // Ignore the button press if the space is already occupied
                                    guard board[row][column] == .none else { return }
                                    
                                    // Set the space to the current player with animation
                                    withAnimation {
                                        board[row][column] = currentPlayer
                                    }
                                    
                                    // Check for a winner
                                    if let newWinner = checkForWinner() {
                                        winner = newWinner
                                        print("winner game")
                                      play = false//hide palyer tour text
                                        counter += 1 //display the confetti animation
                                        coin = coin + 10 // add coins
                                    }else {
                                        // Switch to the other player
                                        currentPlayer = currentPlayer == .x ? .o : .x
                                    }
                                    
                                    // Check if all cases are filled
                                    if allCasesFilled  && winner == nil {
                                        showAlert = true
                                        play = false
                                    }
                                    
                                    
                                    
                                }) {
                                    // Display the space with animation
                                    Rectangle()
                                        .foregroundColor(.white)//foreground color of the palyer
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
                .background(Color.blue.opacity(0.7))
                .cornerRadius(12)
                
                // Display the winner (if any) with animation
                if let winner = winner {
                    
                    Text("Player \(winner.rawValue) wins! 👑")
                        .foregroundColor(.yellow)
                        .font(.largeTitle)
                        .opacity(shouldAnimate ? 1 : 0)
                        .scaleEffect(shouldAnimate ? 1.2 : 0.5)
                    
                        .onAppear {
                            self.shouldAnimate = true
                        }
                    
                    
                }
                
                // Display the restart button with animation
                Button(action: {
                    // Reset the board and winner
                    withAnimation {
                        board = Array(repeating: Array(repeating: Player.none, count: 3), count: 3)
                        winner = nil
                        currentPlayer = .x
                        showAlert = false
                        self.shouldAnimate = false
                       play = false
                        
                    }
                }) {
                    Text("Restart")
                        .frame(width: 250,
                               height: 50,
                               alignment: .center)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                    
                }
                .transition(.opacity)
            
            .padding(100)
            if play == false {
                Howtoplay()
            }else {
                //do nothiings
            }
        }
          
                .alert("Game Over (Tie)", isPresented: $showAlert) {
                    Button("Restart Game", role: .cancel) {
                        // Reset the board and winner
                        withAnimation {
                            board = Array(repeating: Array(repeating: Player.none, count: 3), count: 3)
                            winner = nil
                            currentPlayer = .x
                            play = false
                            
                        }
                    }
                }
                
            }
            .confettiCannon(counter: $counter, num: 50, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
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

