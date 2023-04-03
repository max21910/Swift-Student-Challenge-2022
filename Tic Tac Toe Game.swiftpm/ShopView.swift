import SwiftUI

struct Item: Identifiable {
    let id: String
    let name: String
    let price: Int
}

let items = [
    Item(id: "one", name: "blue Background", price: 20),
    Item(id: "two", name: "orange Background", price: 50),
    Item(id: "three", name: "red Background", price: 100)
]

struct ShopView: View {
    @AppStorage("Coins") var coins: Int = 100
    @AppStorage("💙 Background") var blue = true
    @AppStorage("🧡 Background ") var orange = false
    @AppStorage("❤️ Background") var red = false
    @State private var insufficientCoins = false
    @AppStorage("blueon") var blueon = true
    @AppStorage("orangeon") var redon = false
    @AppStorage("redon") var orangeon = false
    
    
    let items = [
        Item(id: "one", name: "💙 Background", price: 20),
        Item(id: "two", name: "🧡 Background", price: 50),
        Item(id: "three", name: "❤️ Background", price: 100)
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
                VStack {
                    if blue == true {
                        Toggle(isOn: $blueon) {
                            
                            Text("💙 Background ")
                            
                        }.disabled(orangeon)
                        
                    }
                    if orange == true {
                        Toggle(isOn: $orangeon) {
                            Text("🧡 Background ")
                        }.disabled(blueon&&redon)
                    }
                    if red == true {
                        Toggle(isOn: $redon) {
                        Text(" ❤️ Background")
                    }.disabled(blueon&&orangeon)
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
            return blue
        case "two":
            return orange
        case "three":
            return red
        default:
            return false
        }
    }
    
    func markItemAsPurchased(_ item: Item) {
        switch item.id {
        case "one":
            blue = true
        case "two":
            orange = true
        case "three":
            red = true
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
