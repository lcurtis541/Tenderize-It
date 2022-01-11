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

    

    var body: some View {
        VStack{
            VStack{
                HStack(){
                    Text("The Shop")
                        .font(.title)
                    Text(String(format: "%.0f", count))
                        .font(.title)
                    }
                HStack{
                    Menu {
                        Button("Default", action:{ UserDefaults.standard.set("Hammer", forKey: HAMMER_KEY)})
                        Button("Future Hammer", action:{UserDefaults.standard.set("FuruteHammer", forKey: HAMMER_KEY)}).disabled(!fHamBought)
                        Button("Meat Hammer", action:{UserDefaults.standard.set("Meat Hammer", forKey: HAMMER_KEY)}).disabled(!meatHammerBought)
                    }label: {
                        Text("Choose Hammer")
                    }.menuStyle(MenuStyling())
                    Menu {
                        Button("Default", action: chooseBackground)
                        Button("Bruh", action: chooseBackground)
                    } label: {
                        Text("Choose Background")
                    }
                }
            }
            List {
                HStack{
                    VStack{
                        Image("FuruteHammer")
                            .resizable()
                            .frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("Future Hammer")
                            .font(.custom("Futura",size: UIScreen.screenWidth/20))
                    }
                    VStack(){
                        Text("Completely Costmetic. Does not help at all, looks cool tho.")
                            .font(.custom("Futura",size: UIScreen.screenWidth/25))
                            .frame(maxWidth:.infinity)
                        Button(action: buyFutureHam){
                            Text(hammerText)
                        }
                        .buttonStyle(GrowingButton())
                    }
                }
                HStack{
                    VStack{
                        Image("Meat Hammer")
                            .resizable()
                            .frame(width: UIScreen.screenWidth/4, height: UIScreen.screenWidth/4)
                        Text("Meat Hammer")
                            .font(.custom("Futura",size: UIScreen.screenWidth/20))
                    }
                    VStack(){
                        Text("2x for every beat! Combines with the multiplyer too.")
                            .font(.custom("Futura",size: UIScreen.screenWidth/25))
                            .frame(maxWidth:.infinity)
                        Button(action: buyMeatHam){
                            Text(meatHammerText)
                        }
                        .buttonStyle(GrowingButton())
                    }
                }
            }
            Spacer()
            Banner(unitID: "ca-app-pub-3940256099942544/2934735716").frame(width:UIScreen.screenWidth, height:UIScreen.screenHeight/12 )
            
        }
    }
    func buyFutureHam(){
        if(!fHamBought && count>40){
            UserDefaults.standard.set("FuruteHammer", forKey: HAMMER_KEY)
            hammerText = "Bought"
            count -= 40
            fHamBought = true
            UserDefaults.standard.set(true, forKey: FHAMMERB_KEY)
            UserDefaults.standard.set(count, forKey: COUNT_KEY)
        }
    }
    func buyMeatHam(){
        if(!meatHammerBought && count>40){
            UserDefaults.standard.set("Meat Hammer", forKey: HAMMER_KEY)
            meatHammerText = "Bought"
            count -= 40
            meatHammerBought = true
            UserDefaults.standard.set(true, forKey: MHAMMERB_KEY)
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
                .foregroundColor(.red)
        }
}
