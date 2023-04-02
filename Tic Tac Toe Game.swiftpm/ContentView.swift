import SwiftUI
import ConfettiSwiftUI


struct ContentView: View {
    @State private var board = Array(repeating: Array(repeating: Player.none, count: 5), count: 5)
    @State private var currentPlayer = Player.x      //--> Current characters
    @State private var winner: Player? = nil         //--> Player is winner
    @State private var counter: Int = 0              //--> Confetti animation
    @State private var ShowClock = false             //--> Show or hide clock
    @State private var Play = false                  //--> Is a game is played ?
    @State private var ShouldAnimate = false         //--> Show or hide animation
    @AppStorage("coin") var coin: Int = 0            //--> Store the coin value
    
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
    

    
      
      // Define a variable to keep track of whether to show the alert
      @State private var showAlert = false
      
      var body: some View {
          ZStack {
              
              Color.blue.ignoresSafeArea()
              
              VStack(spacing: 20) {
                  // Display the current player
                  if Play == true {
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
                                      Play = true
                                      
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
                                        Play = false//hide palyer tour text
                                          counter += 1 //display the confetti animation
                                          coin = coin + 10 // add coins
                                      }else {
                                          // Switch to the other player
                                          currentPlayer = currentPlayer == .x ? .o : .x
                                      }
                                      
                                      // Check if all cases are filled
                                      if allCasesFilled  && winner == nil {
                                          showAlert = true
                                          Play = false
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
                  .background(Color.white.opacity(0.7))
                  .cornerRadius(12)
                  
                  // Display the winner (if any) with animation
                  if let winner = winner {
                      
                      Text("Player \(winner.rawValue) wins! 👑")
                          .foregroundColor(.yellow)
                          .font(.largeTitle)
                          .opacity(ShouldAnimate ? 1 : 0)
                          .scaleEffect(ShouldAnimate ? 1.2 : 0.5)
                      
                          .onAppear {
                              self.ShouldAnimate = true
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
                          self.ShouldAnimate = false
                         Play = false
                          
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
              if Play == false {
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
                              Play = false
                              
                          }
                      }
                  }
                  
              }
          .confettiCannon(counter: $counter, num: 100, rainHeight: 1000, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
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

