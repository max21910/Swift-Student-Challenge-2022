import SwiftUI

struct Item: Identifiable {
    let id: String
    let name: String
    let price: Int
}


struct ShopView: View {
    @AppStorage("Coins1") var coins: Int = 1000
    @AppStorage("🧡 Background ") var orange = false
    @AppStorage("❤️ Background") var red = false
    @State private var insufficientCoins = false
    @AppStorage("blueon") var blueon = true
    @AppStorage("orangeon") var redon = false
    @AppStorage("redon") var orangeon = false
    @AppStorage("moneyanim ") var moneyanim = false

    @AppStorage("moneyanimon ") var moneyanimon = false

    
    
    let items = [
     
        Item(id: "two", name: "🧡 Background", price: 50),
        Item(id: "three", name: "❤️ Background", price: 100),
        Item(id: "four", name: "💸 Money Animation", price: 150),
        
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
                    Text("Customisation : ")
                       
                        .font(.title)
                        .bold()
                    
                    if orange == true {
                        Toggle(isOn: $orangeon) {
                            Text("🧡 Background ")
                        }.disabled(redon)
                            .disabled(redon)
                    }
                    if red == true {
                        Toggle(isOn: $redon) {
                            Text(" ❤️ Background")
                        }.disabled(orangeon)
                    }
                    if moneyanim == true {
                        Toggle(isOn: $moneyanimon) {
                            Text(" 💸 Animation ")
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
       
        case "two":
            return orange
        case "three":
            return red
        case "four":
            return moneyanim
      
        default:
            return false
        }
    }
    
    func markItemAsPurchased(_ item: Item) {
        switch item.id {
       
        case "two":
            orange = true
        case "three":
            red = true
        case "four":
            moneyanim = true
       
            
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
