//
//  StoreView.swift
//  Tenderize It
//
//  Created by Landon on 1/7/22.
//

import SwiftUI

struct StoreView: View {
    @State var count: Double = UserDefaults.standard.double(forKey: COUNT_KEY)
    @State var ham: String = UserDefaults.standard.string(forKey: HAMMER_KEY) ?? "Hammer"
    @State var fHamBought:Bool = UserDefaults.standard.bool(forKey: FHAMMERB_KEY)
    @State var hammerText:String = UserDefaults.standard.bool(forKey: FHAMMERB_KEY) ? "Bought" : "2000"
    @State var meatHammerBought:Bool = UserDefaults.standard.bool(forKey: MHAMMERB_KEY)
    @State var meatHammerText:String = UserDefaults.standard.bool(forKey: MHAMMERB_KEY) ? "Bought" : "2000"
    var autoPrice = [1000,2000,5000,10000,50000]
    @State var numAuto = UserDefaults.standard.integer(forKey: AUTO_KEY)
    @State var autoText = ""
    @State var twoxText: String = UserDefaults.standard.bool(forKey: TWOX_KEY) ? "Bought" : "10k"
    @State var twoxBought:Bool = UserDefaults.standard.bool(forKey: TWOX_KEY)
    
    
    let numForm = NumberFormatter()

    var body: some View {
        VStack{
            VStack{
                HStack(){
                    Text("The Shop")
                        .font(.title)
                    Text(String(format: "%.0f", count))
                        .font(.title)
                } .onAppear(){
                    numForm.numberStyle = .decimal                }
                HStack{
                    Menu {
                        Button("Default", action:{ UserDefaults.standard.set("Hammer", forKey: HAMMER_KEY)})
                        Button("Future Hammer", action:{UserDefaults.standard.set("FuruteHammer", forKey: HAMMER_KEY)}).disabled(!fHamBought)
                        Button("Meat Hammer", action:{UserDefaults.standard.set("Meat Hammer", forKey: HAMMER_KEY)}).disabled(!meatHammerBought)
                    }label: {
                        Text("Hammer")
                    }
                        .padding(7)
                        .background(Color(red: 100/255, green: 73/255, blue: 36/255))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    Menu {
                        Button("Default", action: chooseBackground)
                        //Button("Bruh", action: chooseBackground)
                    } label: {
                        Text("Meat")
                    }
                    .padding(7)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    Menu {
                        Button("Default", action: chooseBackground)
                        //Button("Bruh", action: chooseBackground)
                    } label: {
                        Text("Background")
                    }
                    .padding(7)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())                }
            }
            List {
                HStack{
                    VStack(alignment:.center){
                        Image("FuruteHammer")
                            .resizable()
                            .frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("Future Hammer")
                            .font(.custom("Futura",size: UIScreen.screenWidth/20))
                            .frame(maxWidth:.infinity)
                    }
                    VStack(alignment:.center){
                        Text("Completely cosmetic. Does not help at all, looks cool tho.")
                            .font(.custom("Futura",size: UIScreen.screenWidth/25))
                            .frame(maxWidth:.infinity)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(1)
                        Button(action: buyFutureHam){
                            Text(hammerText)
                        }
                        .buttonStyle(GrowingButton())
                    }
                }
                HStack{
                    VStack(alignment:.center){
                        Image("Meat Hammer")
                            .resizable()
                            .frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("Meat Hammer")
                            .font(.custom("Futura",size: UIScreen.screenWidth/20))
                            .frame(maxWidth:.infinity)
                    }
                    VStack(alignment:.center){
                        Text("2x for every beat! Combines with the multiplyer too.")
                            .font(.custom("Futura",size: UIScreen.screenWidth/25))
                            .frame(maxWidth:.infinity)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(1)
                        Button(action: buyMeatHam){
                            Text(meatHammerText)
                        }
                        .buttonStyle(GrowingButton())
                    }
                }
                HStack{
                    VStack(alignment:.center){
                        Image("AutoClicker")
                            .resizable()
                            .frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("Auto Clicker")
                            .font(.custom("Futura",size: UIScreen.screenWidth/20))
                            .frame(maxWidth:.infinity)
                    }
                    VStack(alignment:.center){
                        Text("Beats your meat for you! 1 click per second. Very helpful.")
                            .font(.custom("Futura",size: UIScreen.screenWidth/25))
                            .frame(maxWidth:.infinity)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(1)
                        Button(action: buyAuto){
                            Text(String(autoText))
                        }
                        .buttonStyle(GrowingButton())
                        .onAppear(){
                            if(numAuto == 4){
                                self.autoText = "Bought"
                            } else{
                                self.autoText = String(autoPrice[numAuto])
                            }

                        }
                        Text("Amount:\(numAuto)  Max:4")
                            .font(.custom("Futura",size: UIScreen.screenWidth/25))
                            .frame(maxWidth:.infinity)
                            .multilineTextAlignment(.center)
                            .padding(1)
                    }
                    
                }
                HStack{
                    VStack(alignment:.center){
                        Text("2x")
                            .frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("2x Multiplyer")
                            .font(.custom("Futura",size: UIScreen.screenWidth/20))
                            .frame(maxWidth:.infinity)
                    }
                    VStack(alignment:.center){
                        Text("Multi starts and resets back to 2.0.")
                            .font(.custom("Futura",size: UIScreen.screenWidth/25))
                            .frame(maxWidth:.infinity)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(1)
                        Button(action: buy2x){
                            Text(twoxText)
                        }
                        .buttonStyle(GrowingButton())
                    }
                }            }
            Spacer()
            Banner(unitID: "ca-app-pub-4056532790569466/7540809053").frame(width:UIScreen.screenWidth, height:UIScreen.screenHeight/12 )
            
        }
    }
    func buyFutureHam(){
        if(!fHamBought && count>2000){
            UserDefaults.standard.set("FuruteHammer", forKey: HAMMER_KEY)
            hammerText = "Bought"
            count -= 2000
            fHamBought = true
            UserDefaults.standard.set(true, forKey: FHAMMERB_KEY)
            UserDefaults.standard.set(count, forKey: COUNT_KEY)
        }
    }
    func buyMeatHam(){
        if(!meatHammerBought && count>2000){
            UserDefaults.standard.set("Meat Hammer", forKey: HAMMER_KEY)
            meatHammerText = "Bought"
            count -= 2000
            meatHammerBought = true
            UserDefaults.standard.set(true, forKey: MHAMMERB_KEY)
            UserDefaults.standard.set(count, forKey: COUNT_KEY)
        }
    }
    func buyAuto(){
        if(Int(count)>autoPrice[numAuto] && numAuto != 4){
            count -= Double(autoPrice[numAuto])
            UserDefaults.standard.set(count, forKey: COUNT_KEY)
            numAuto += 1
            UserDefaults.standard.set(numAuto, forKey: AUTO_KEY)
            if(numAuto == 4){
                self.autoText = "Bought"
            } else{
                self.autoText = String(autoPrice[numAuto])
            }
        }
    }
    func buy2x(){
        if(!twoxBought && count>10000){
            UserDefaults.standard.set(true, forKey: TWOX_KEY)
            twoxText = "Bought"
            count -= 10000
            twoxBought = true
            UserDefaults.standard.set(count, forKey: COUNT_KEY)
        }
        
    }
    func chooseHam(hammer: String){
        UserDefaults.standard.set(hammer, forKey: HAMMER_KEY)
    }
    func chooseBackground(){
        
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
struct MenuStyling: MenuStyle {
    func makeBody(configuration: Configuration) -> some View {
            Menu(configuration)
                .padding(7)
                .foregroundColor(.white)
                .clipShape(Capsule())

        }
}
