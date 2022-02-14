//
//  ContentView.swift
//  Shared
//
//  Created by Landon on 1/6/22.
//

import SwiftUI
import AVFoundation
import Firebase

var player:AVAudioPlayer?
let COUNT_KEY = "Count"
let BACK_KEY = "Back"
let HAMMER_KEY = "Hammer"
let FHAMMERB_KEY = "FHammer"
let MHAMMERB_KEY = "MHammer"
let CHALLENGE_KEY = "Challenge"
let AUTO_KEY = "Auto"
let TWOX_KEY = "2x"
let CHAIN_KEY = "ChainBBY"
let MEAT_KEY = "MEAT"
let OGBACK_KEY = "I mean OG"
let GHAMMER_KEY = "ALL I SEE IS GOLD"
let THOR_KEY = "Thor"
let PRISONBACK_KEY = "Prison"


struct ContentView: View {

    @State var count: Double = UserDefaults.standard.double(forKey: COUNT_KEY)
    @State var ham: String = UserDefaults.standard.string(forKey: HAMMER_KEY) ?? "Hammer"
    @State var meat: String = UserDefaults.standard.string(forKey: MEAT_KEY) ?? "steak"
    @State var background: String = UserDefaults.standard.string(forKey: BACK_KEY) ?? "Background"
    @State var meatHit: Double = (UserDefaults.standard.string(forKey: MEAT_KEY) == "CSteak") ? 10.0 : 1.0
    @State var backHit: Double = (UserDefaults.standard.string(forKey: BACK_KEY) == "Prison") ? 2.0 : 1.0
    @State var perHit: Int = (UserDefaults.standard.string(forKey: HAMMER_KEY) == "Meat Hammer") ? 2 : 1
    @State var multiBase: Double = (UserDefaults.standard.bool(forKey: TWOX_KEY) == true) ? 2.0 : 1.0
    @State var multiplyer: Double = (UserDefaults.standard.bool(forKey: TWOX_KEY) == true) ? 2.0 : 1.0
    @State private var willMoveToNextScreen = false
    @State var degree: Double = 0
    @State var audioPlayer1: AVAudioPlayer!
    @State var audioPlayer2: AVAudioPlayer!
    @State var audioPlayer3: AVAudioPlayer!
    @State var audioPlayer4: AVAudioPlayer!
    @State var audioPlayer5: AVAudioPlayer!
    @State var audioPlayer6: AVAudioPlayer!
    @State var audioPlayer7: AVAudioPlayer!
    @State var audioPlayer8: AVAudioPlayer!
    @State var audioPlayer9: AVAudioPlayer!
    @State var audioPlayer10: AVAudioPlayer!
    @State private var showingShop = false
    @State private var showChal = false
    @State var audioCount: Int = 1
    @State var lastHit = Date()
    @State var hitAmmount = 1.0
    @State var ammountVis1 = false
    @State var ammountOp1 = 0
    let numForm = NumberFormatter()
    @State var autoBeaters = UserDefaults.standard.integer(forKey: AUTO_KEY)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View{

        ZStack{
            GeometryReader { geo in
                Image(background)
                    .resizable()
                    .frame(width: UIScreen.screenWidth * 1.1, height: UIScreen.screenHeight * 1.1)
                    .offset(x: -(UIScreen.screenWidth/20),y:-(UIScreen.screenHeight/10))
            } .onAppear(){
                numForm.numberStyle = .decimal            }
            
        VStack{
            HStack(spacing:(UIScreen.screenWidth/2)){
                VStack(spacing:(UIScreen.screenWidth/200)){
                    Text("Beats")
                        .lineLimit(1)
                        .font(.system(size: UIScreen.screenWidth/15, design: .rounded))
                        .foregroundColor(Color.white)
                        .shadow(color: .black, radius: 5)
                        .onReceive(timer) { _ in
                            count += Double(autoBeaters)
                            let diffComponents = Date().timeIntervalSinceReferenceDate-lastHit.timeIntervalSinceReferenceDate
                            if(diffComponents < 3.0){
                                multiplyer += 0.001
                            } else{
                                multiplyer = multiBase
                            }                        }
                    VStack{
                        Text(formatNumber(count))
                            .lineLimit(1)
                            .font(.system(size: UIScreen.screenWidth/23, design: .rounded))
                            .fixedSize(horizontal: true, vertical: true)
                            .frame(maxWidth:.infinity)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.white)
                            .shadow(color: .black, radius: 5)
                            .layoutPriority(1)
                    }
                    .padding()
                    .frame(width:UIScreen.screenWidth/4.5,height:UIScreen.screenWidth/7)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.blue, lineWidth: 4)
                    )
                }
                VStack(spacing:(UIScreen.screenWidth/200)){
                    Text("Multi")
                        .lineLimit(1)
                        .font(.system(size: UIScreen.screenWidth/15, design: .rounded))
                        .foregroundColor(Color.white)
                        .shadow(color: .black, radius: 5)
                    VStack{
                        Text(String(format: "%.2f", multiplyer))
                            .lineLimit(1)
                            .foregroundColor(Color.white)
                            .shadow(color: .black, radius: 5)
                            .font(.system(size: UIScreen.screenWidth/23, design: .rounded))
                    }
                    .padding()
                    .frame(width:UIScreen.screenWidth/4.5,height:UIScreen.screenWidth/7)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.blue, lineWidth: 4))
                        }
            }
            .offset(y:-(UIScreen.screenHeight * 0.375))
                

            ZStack{
            Button (action: beatMeat ,label: {
                Image(meat)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:UIScreen.screenHeight/5, height: UIScreen.screenHeight/5)
                
            })
                .padding(30)
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ _ in
                            self.degree = 60
                            self.ammountVis1.toggle()
                            self.ammountOp1 = 1
                            
                        })
                        .onEnded({ _ in
                            self.ammountVis1.toggle()
                            self.degree = 0
                            withAnimation(.linear(duration:4).repeatForever(autoreverses:true),{
                                self.ammountOp1 = 0
                            })
                            
                        })
                )
                .onAppear {
                    let sound = Bundle.main.path(forResource: "Beat", ofType: "wav")
                    self.audioPlayer1 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer2 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer3 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer4 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer5 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer6 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer7 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer8 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer9 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer10 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                       
                       }
                Text("+\(Int(hitAmmount))")
                    .foregroundColor(Color.white)
                    .shadow(color: .black, radius: 5)
                    .font(.system(size: UIScreen.screenWidth/23, design: .rounded))
                    .opacity(Double(ammountOp1))
                    .offset(x: ammountVis1 ? 50: 0,y: ammountVis1 ? -50: 0)
                    .animation(.linear.repeatForever(autoreverses:true))
                    .id(self.hitAmmount.hashValue)
                
            }
            ZStack(alignment: .leading){
                HStack{
                    Button("Shop") {
                                showingShop.toggle()
                        UserDefaults.standard.set(count, forKey: COUNT_KEY)
                        
                    }
                            .sheet(isPresented: $showingShop,onDismiss: updateShop) {
                                StoreView()
                            }
                            .offset(y:(UIScreen.screenHeight * 0.1))
                            .buttonStyle(GrowingButton())
                    Button("Challenge"){
                        willMoveToNextScreen.toggle()
                    }
                            .offset(y:(UIScreen.screenHeight * 0.1))
                            .buttonStyle(GrowingButton())
                }
            }                   
            
        }
        .offset(y:UIScreen.screenHeight/7)
        ZStack(alignment: .leading){
            Button (action: beatMeat ,label: {
                Image(ham)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:UIScreen.screenHeight/5, height: UIScreen.screenHeight/5)
                    .rotationEffect(.degrees(degree))
                
            })
                .padding(30)
                //.buttonStyle(PlainButtonStyle())
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ _ in
                            self.degree = 60
                            self.ammountVis1.toggle()
                        })
                        .onEnded({ _ in
                            self.degree = 0
                            self.ammountVis1.toggle()
                            
                        })
                )
                .onAppear {
                    let sound = Bundle.main.path(forResource: "Beat", ofType: "wav")
                    self.audioPlayer1 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer2 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer3 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer4 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer5 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer6 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer7 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer8 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer9 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer10 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.hitAmmount = multiplyer * Double(perHit) * meatHit * backHit
                       }
        }
        .offset(x:-(UIScreen.screenHeight/13),y:UIScreen.screenHeight/8)

        }.navigate(to: TenderizeItChallenge(), when: $willMoveToNextScreen)

        
            
            
        }
    func updateShop(){
        count = UserDefaults.standard.double(forKey: COUNT_KEY)
        ham = UserDefaults.standard.string(forKey: HAMMER_KEY) ?? "Hammer"
        autoBeaters = UserDefaults.standard.integer(forKey: AUTO_KEY)
        multiBase = (UserDefaults.standard.bool(forKey: TWOX_KEY) == true) ? 2.0 : 1.0
        multiplyer = (UserDefaults.standard.bool(forKey: TWOX_KEY) == true) ? 2.0 : 1.0
        meat = UserDefaults.standard.string(forKey: MEAT_KEY) ?? "steak"
        background = UserDefaults.standard.string(forKey: BACK_KEY) ?? "Background"
        if(ham == "Meat Hammer"){
            perHit = 2
        } else if( ham == "Gold Hammer"){
            perHit = 5
        } else if( ham == "Mjölnir"){
            perHit = 10
        } else{
            perHit = 1
        }
        if(meat == "CSteak"){
            meatHit = 10
        } else{
            meatHit = 1
        }
        if(background == "Prison"){
            backHit = 2
        } else{
            backHit = 1
        }
    }
    func beatMeat(){
        self.hitAmmount = multiplyer * Double(perHit) * meatHit * backHit
        self.count += hitAmmount
        UserDefaults.standard.set(count, forKey: COUNT_KEY)
        switch audioCount{
        case 1:
            audioPlayer1?.play()
            audioCount = 2
        case 2:
            audioPlayer2?.play()
            audioCount = 3
        case 3:
            audioPlayer3?.play()
            audioCount = 4
        case 4:
            audioPlayer1?.play()
            audioCount = 5
        case 5:
            audioPlayer2?.play()
            audioCount = 6
        case 6:
            audioPlayer3?.play()
            audioCount = 7
        case 7:
            audioPlayer1?.play()
            audioCount = 8
        case 8:
            audioPlayer2?.play()
            audioCount = 9
        case 9:
            audioPlayer3?.play()
            audioCount = 10
        case 10:
            audioPlayer3?.play()
            audioCount = 1
        default:
            break
            
        }
        let diffComponents = Date().timeIntervalSinceReferenceDate-lastHit.timeIntervalSinceReferenceDate
        if(diffComponents < 3.0){
            multiplyer += 0.001
        } else{
            multiplyer = multiBase
        }
        lastHit = Date()
        
    }

    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {        Group {
        ContentView()    }
    }}

class Count: UIViewController {

    var cur = 0;

    @IBOutlet weak var money: UILabel!

    @IBAction func pressbutton(sender: UIButton) {
        cur = Int(money.text!)!;
        self.money.text = String(cur + 1);

    }

}
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

/*
NavigationView{
    VStack{
        NavigationLink(destination: TenderizeChall()){
            Text("Chal")
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient( colors: [Color.red,Color.blue]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
        }
    }
}

*/
extension View {
            /// Navigate to a new view.
                               /// - Parameters:
                               ///   - view: View to navigate to.
                               ///   - binding: Only navigates when this condition is `true`.
                               func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
                                   NavigationView {
                                       ZStack {
                                           self
                                               .navigationBarTitle("")
                                               .navigationBarHidden(true)

                                           NavigationLink(
                                               destination: view
                                                   .navigationBarTitle("")
                                                   .navigationBarHidden(true),
                                               isActive: binding
                                           ) {
                                               EmptyView()
                                           }
                                       }
                                   }
                                   .navigationViewStyle(.stack)
                               }
                           }
extension Double {
    func reduceScale(to places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self // move the decimal right
        let truncated = Double(Int(newDecimal)) // drop the fraction
        let originalDecimal = truncated / multiplier // move the decimal back
        return originalDecimal
    }
}

func formatNumber(_ n: Double) -> String {
    let numForm = NumberFormatter()
    numForm.numberStyle = .decimal
    let num = abs(Double(n))
    let sign = (n < 0) ? "-" : ""
    if(num<100000.0){
        return numForm.string(from: NSNumber(value: Int(num)))!
        
    } else{
        switch num {
        case 1_000_000_000...:
            var formatted = num / 1_000_000_000
            formatted = formatted.reduceScale(to: 3)
            return "\(sign)\(formatted)B"

        case 1_000_000...:
            var formatted = num / 1_000_000
            formatted = formatted.reduceScale(to: 3)
            return "\(sign)\(formatted)M"

        case 1_000...:
            var formatted = num / 1_000
            formatted = formatted.reduceScale(to: 3)
            return "\(sign)\(formatted)K"

        case 0...:
            return "\(n)"

        default:
            return "\(sign)\(n)"
        }
    }
}
