import SwiftUI

struct Item: Identifiable {
    let id: String
    let name: String
    let price: Int
}


struct ShopView: View {
    @AppStorage("Coins1") var Coins: Int = 1000
    @AppStorage("🖤 Background ") var black = false
    @AppStorage("❤️ Background") var red = false
    @AppStorage("blueon") var blueon = false
    @AppStorage("redon") var redon = false
    @AppStorage("blackon") var blackon = false
    @AppStorage("moneyanim ") var moneyanim = false
    @AppStorage("moneyanimon ") var moneyanimon = false
    @State private var devoption = false
    @State private var insufficientCoins = false
    
    
    //Itms inside the shop
let items = [
     
        Item(id: "two", name: "🖤 Background", price: 50),
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
                    Text("\(Coins)")
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
                                if item.price <= Coins {
                                    withAnimation {
                                        Coins -= item.price
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
                    
                    if black == true {
                        Toggle(isOn: $blackon) {
                            Text("🖤 Background ")
                        }.disabled(redon)
                            
                    }
                    if red == true {
                        Toggle(isOn: $redon) {
                            Text(" ❤️ Background")
                        }.disabled(blackon)
                    }
                    if moneyanim == true {
                        Toggle(isOn: $moneyanimon) {
                            Text(" 💸 Animation ")
                        }
                        
                    }
                    Toggle(isOn: $devoption ) {
                        Text("⚠️📱 Show dev option 📱⚠️")
                    }
                    if devoption == true {
                        Button {  //reset shop achat
                            black = false
                            red = false
                            moneyanim = false
                            
                        } label: {
                            Text("reset shop")
                                .frame(width: 150,
                                       height: 50,
                                       alignment: .center)
                                .background(Color.green)
                                .foregroundColor(Color.white)
                                .cornerRadius(20)
                        }
                        Button { //add 1000 coin to test shop
                            
                            Coins = Coins + 1000
                        } label: {
                            Text("add coin")
                                .frame(width: 150,
                                       height: 50,
                                       alignment: .center)
                                .background(Color.green)
                                .foregroundColor(Color.white)
                                .cornerRadius(20)
                        }
                        Button {   //reset coin to zero to test insufficientCoins function
                            
                            Coins =  0
                        } label: {
                            Text("reset coin")
                                .frame(width: 150,
                                       height: 50,
                                       alignment: .center)
                            
                                .background(Color.green)
                                .foregroundColor(Color.white)
                                .cornerRadius(20)
                        }
                        
                        
                    }
                }
                       
                
                .padding()
                
                Spacer() // Ajout du Spacer
                //animation if insufficientCoins is true
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
            return black
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
            black = true
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
