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
let HAMMER_KEY = "Hammer"
let FHAMMERB_KEY = "FHammer"
let MHAMMERB_KEY = "MHammer"


struct ContentView: View {
    @State var count: Double = UserDefaults.standard.double(forKey: COUNT_KEY)
    @State var ham: String = UserDefaults.standard.string(forKey: HAMMER_KEY) ?? "Hammer"
    @State var perHit: Int = (UserDefaults.standard.string(forKey: HAMMER_KEY) == "Meat Hammer") ? 2 : 1
    @State var multiplyer: Double = 1
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
    @State var audioCount: Int = 1
    @State var lastHit = Date()
    var body: some View{
        ZStack{
            GeometryReader { geo in
                Image("Background")
                    .resizable()
                    .frame(width: UIScreen.screenWidth * 1.1, height: UIScreen.screenHeight * 1.1)
                    .offset(x: -(UIScreen.screenWidth/20),y:-(UIScreen.screenHeight/10))
            }
            
        VStack{
            HStack(spacing:(UIScreen.screenWidth/2)){
                VStack{
                    Text("Beats")
                        .lineLimit(1)
                        .font(.system(size: UIScreen.screenWidth/25))
                    Text(String(format: "%.0f", count))
                        .lineLimit(1)
                        .font(.system(size: UIScreen.screenWidth/25))
                }
                .padding()
                .frame(width:UIScreen.screenWidth/5,height:UIScreen.screenWidth/5)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 4)
                )
                VStack{
                    Text("Multi")
                        .lineLimit(1)
                        .font(.system(size: UIScreen.screenWidth/25))
                    Text(String(format: "%.2f", multiplyer))
                        .lineLimit(1)
                        .font(.system(size: UIScreen.screenWidth/25))
                }
                .padding()
                .frame(width:UIScreen.screenWidth/5,height:UIScreen.screenWidth/5)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 4)
                )
            
            }
            .offset(y:-(UIScreen.screenHeight * 0.35))
                

            
            Button (action: {
                self.count += multiplyer * Double(perHit)
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
                    multiplyer = 1.0
                }
                lastHit = Date()
                
                    },label: {
                Image("steak")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:UIScreen.screenHeight/5, height: UIScreen.screenHeight/5)
                
            })
                .padding(30)
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ _ in
                            self.degree = 60
                            
                        })
                        .onEnded({ _ in
                            self.degree = 0
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
            ZStack(alignment: .leading){
                Button("Shop") {
                            showingShop.toggle()
                        }
                        .sheet(isPresented: $showingShop,onDismiss: updateShop) {
                            StoreView()
                        }
                        .offset(y:(UIScreen.screenHeight * 0.1))
                        .buttonStyle(GrowingButton())
            }
            
        }
        .offset(y:UIScreen.screenHeight/7)
        ZStack(alignment: .leading){
            Image(ham)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.screenHeight/5, height: UIScreen.screenHeight/5)
                .rotationEffect(.degrees(degree))
        }
        .offset(x:-(UIScreen.screenHeight/13),y:UIScreen.screenHeight/8)

        }

        
            
            
        }
    func updateShop(){
        count = UserDefaults.standard.double(forKey: COUNT_KEY)
        ham = UserDefaults.standard.string(forKey: HAMMER_KEY) ?? "Hammer"
        if(ham == "Meat Hammer"){
            perHit = 2
        } else{
            perHit = 1
        }
        

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



