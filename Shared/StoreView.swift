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
    var autoPrice = [1000,2000,5000,10000,50000,100000,500000,1000000]
    @State var numAuto = UserDefaults.standard.integer(forKey: AUTO_KEY)
    @State var autoText = ""
    @State var twoxText: String = UserDefaults.standard.bool(forKey: TWOX_KEY) ? "Bought" : "10k"
    @State var twoxBought:Bool = UserDefaults.standard.bool(forKey: TWOX_KEY)
    @State var chainText: String = UserDefaults.standard.bool(forKey: CHAIN_KEY) ? "Bought" : "50k"
    @State var chainBought:Bool = UserDefaults.standard.bool(forKey: CHAIN_KEY)
    @State var OGBackText: String = UserDefaults.standard.bool(forKey: OGBACK_KEY) ? "Bought" : "50k"
    @State var OGBackBought:Bool = UserDefaults.standard.bool(forKey: OGBACK_KEY)
    @State var goldHammerBought:Bool = UserDefaults.standard.bool(forKey: GHAMMER_KEY)
    @State var goldHammerText:String = UserDefaults.standard.bool(forKey: GHAMMER_KEY) ? "Bought" : "75k"
    @State var thorBought:Bool = UserDefaults.standard.bool(forKey: THOR_KEY)
    @State var thorText:String = UserDefaults.standard.bool(forKey: THOR_KEY) ? "Bought" : "100k"
    let numForm = NumberFormatter()

    var body: some View {
        VStack{
            VStack{
                HStack(){
                    Text("The Shop")
                        .font(.title)
                    Text(numForm.string(from: NSNumber(value: Int(count)))!)
                        .font(.title)
                        .foregroundColor(Color.blue)
                } .onAppear(){
                    numForm.numberStyle = .decimal                }
                HStack{
                    Menu {
                        Button("Default", action:{ UserDefaults.standard.set("Hammer", forKey: HAMMER_KEY)})
                        Button("Future Hammer", action:{UserDefaults.standard.set("FuruteHammer", forKey: HAMMER_KEY)}).disabled(!fHamBought)
                        Button("Meat Hammer", action:{UserDefaults.standard.set("Meat Hammer", forKey: HAMMER_KEY)}).disabled(!meatHammerBought)
                        Button("Gold Hammer", action:{UserDefaults.standard.set("Gold Hammer", forKey: HAMMER_KEY)}).disabled(!goldHammerBought)
                        Button("Mjölnir", action:{UserDefaults.standard.set("Mjölnir", forKey: HAMMER_KEY)}).disabled(!thorBought)
                    }label: {
                        Text("Hammer")
                    }
                        .padding(7)
                        .background(Color(red: 100/255, green: 73/255, blue: 36/255))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                    Menu {
                        Button("Default", action:{UserDefaults.standard.set("steak", forKey: MEAT_KEY)})
                        Button("Iced Meat", action:{UserDefaults.standard.set("CSteak", forKey: MEAT_KEY)}).disabled(!chainBought)
                    } label: {
                        Text("Meat")
                    }
                    .padding(7)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    Menu {
                        Button("Default", action:{UserDefaults.standard.set("Background", forKey: BACK_KEY)})
                        Button("OG Background", action:{UserDefaults.standard.set("OGBackground", forKey: BACK_KEY)}).disabled(!OGBackBought)
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
                        Image("Gold Hammer")
                            .resizable()
                            .frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("Gold Hammer")
                            .font(.custom("Futura",size: UIScreen.screenWidth/20))
                            .frame(maxWidth:.infinity)
                    }
                    VStack(alignment:.center){
                        Text("Its made of Gold! Thats awesome, 5x on hits.")
                            .font(.custom("Futura",size: UIScreen.screenWidth/25))
                            .frame(maxWidth:.infinity)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(1)
                        Button(action: buyGoldHam){
                            Text(goldHammerText)
                        }
                        .buttonStyle(GrowingButton())
                    }
                }
                
                HStack{
                    VStack(alignment:.center){
                        Image("Mjölnir")
                            .resizable()
                            .frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("Mjölnir")
                            .font(.custom("Futura",size: UIScreen.screenWidth/20))
                            .frame(maxWidth:.infinity)
                    }
                    VStack(alignment:.center){
                        Text("Thor would be proud, 10x on hits.")
                            .font(.custom("Futura",size: UIScreen.screenWidth/25))
                            .frame(maxWidth:.infinity)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(1)
                        Button(action: buyThor){
                            Text(thorText)
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
                            if(numAuto == 8){
                                self.autoText = "Bought"
                            } else{
                                self.autoText = String(autoPrice[numAuto])
                            }

                        }
                        Text("Amount:\(numAuto)  Max:8")
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
                }
                HStack{
                    VStack(alignment:.center){
                        Image("CSteak")
                            .resizable()
                            .frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("Iced Steak")
                            .font(.custom("Futura",size: UIScreen.screenWidth/20))
                            .frame(maxWidth:.infinity)
                    }
                    VStack(alignment:.center){
                        Text("Nothing much to say. Too cool. 10x per hit")
                            .font(.custom("Futura",size: UIScreen.screenWidth/25))
                            .frame(maxWidth:.infinity)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(1)
                        Button(action: buyChain){
                            Text(chainText)
                        }
                        .buttonStyle(GrowingButton())
                    }
                }
                HStack{
                    VStack(alignment:.center){
                        Image("OGBackground")
                            .resizable()
                            .frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("OG Background")
                            .font(.custom("Futura",size: UIScreen.screenWidth/20))
                            .frame(maxWidth:.infinity)
                    }
                    VStack(alignment:.center){
                        Text("The original background from the android game.")
                            .font(.custom("Futura",size: UIScreen.screenWidth/25))
                            .frame(maxWidth:.infinity)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(1)
                        Button(action: buyOGBack){
                            Text(OGBackText)
                        }
                        .buttonStyle(GrowingButton())
                    }
                }
            }
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
    func buyGoldHam(){
        if(!goldHammerBought && count>5000){
            UserDefaults.standard.set("Gold Hammer", forKey: HAMMER_KEY)
            goldHammerText = "Bought"
            count -= 5000
            goldHammerBought = true
            UserDefaults.standard.set(true, forKey: GHAMMER_KEY)
            UserDefaults.standard.set(count, forKey: COUNT_KEY)
        }
    }
    func buyThor(){
        if(!thorBought && count>100000){
            UserDefaults.standard.set("Mjölnir", forKey: HAMMER_KEY)
            thorText = "Bought"
            count -= 5000
            thorBought = true
            UserDefaults.standard.set(true, forKey: THOR_KEY)
            UserDefaults.standard.set(count, forKey: COUNT_KEY)
        }
    }
    func buyAuto(){
        if(Int(count)>autoPrice[numAuto] && numAuto != 8){
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
    func buyChain(){
        if(!chainBought && count>50000){
            UserDefaults.standard.set("CSteak", forKey: MEAT_KEY)
            chainText = "Bought"
            count -= 50000
            chainBought = true
            UserDefaults.standard.set(true, forKey: CHAIN_KEY)
            UserDefaults.standard.set(count, forKey: COUNT_KEY)
        }
    }
    func buyOGBack(){
        if(!OGBackBought && count>50000){
            UserDefaults.standard.set("OGBackground", forKey: BACK_KEY)
            OGBackText = "Bought"
            count -= 50000
            OGBackBought = true
            UserDefaults.standard.set(true, forKey: OGBACK_KEY)
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
