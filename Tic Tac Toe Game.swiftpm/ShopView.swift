import SwiftUI

struct Item: Identifiable {
    let id: String
    let name: String
    let price: Int
}

let items = [
    Item(id: "one", name: "🎉 Confetti", price: 20),
    Item(id: "two", name: "💸 Money", price: 50),
    Item(id: "three", name: "❤️ Love", price: 100)
]

struct ShopView: View {
    @AppStorage("Coins") var coins: Int = 100
    @AppStorage("🎉 Confetti") var confetti = true
    @AppStorage("💸 Money") var money = false
    @AppStorage("❤️ Love") var love = false
    @State private var insufficientCoins = false
    
    let items = [
        Item(id: "one", name: "🎉 Confetti", price: 20),
        Item(id: "two", name: "💸 Money", price: 50),
        Item(id: "three", name: "❤️ Love", price: 100)
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    Image(systemName: "dollarsign.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.yellow)
                    Text("\(coins)")
                        .font(.headline)
                        .foregroundColor(.yellow)
                }
                List(items) { item in
                    HStack {
                        Text(item.name)
                        Spacer()
                        if itemIsPurchased(item) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.green)
                        } else {
                            Text("\(item.price) Coins")
                                .foregroundColor(.yellow)
                            Button(action: {
                                if item.price <= coins {
                                    withAnimation {
                                        coins -= item.price
                                        markItemAsPurchased(item)
                                    }
                                } else {
                                    withAnimation {
                                        insufficientCoins = true
                                    }
                                }
                            }) {
                                Text("Buy")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
                .padding()
                
                Spacer() // Ajout du Spacer
                
                if insufficientCoins {
                    Text("Insufficient coins")
                        .foregroundColor(.red)
                        .padding(.bottom, 20) // Ajout du padding
                        .animation(.default, value: insufficientCoins)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation {
                                    insufficientCoins = false
                                }
                            }
                        }
                }
            }
            .navigationTitle("Shop")
        }
    }
    
    func itemIsPurchased(_ item: Item) -> Bool {
        switch item.id {
        case "one":
            return confetti
        case "two":
            return money
        case "three":
            return love
        default:
            return false
        }
    }
    
    func markItemAsPurchased(_ item: Item) {
        switch item.id {
        case "one":
            confetti = true
        case "two":
            money = true
        case "three":
            love = true
        default:
            break
        }
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
