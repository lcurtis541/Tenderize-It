//
//  ContentView.swift
//  Shared
//
//  Created by Landon on 1/6/22.
//

import SwiftUI
import AVFoundation

var player:AVAudioPlayer?
let COUNT_KEY = "Count"
let HAMMER_KEY = "Hammer"


struct ContentView: View {
    @State var count: Double = UserDefaults.standard.double(forKey: COUNT_KEY)
    @State var ham: String = UserDefaults.standard.string(forKey: HAMMER_KEY) ?? "Hammer"
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
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.top)
                    .offset(y:10)
            }
            
        VStack{
            HStack(spacing:140){
                VStack{
                    Text("Beats")
                        .lineLimit(1)
                    Text(String(format: "%.0f", count))
                        .lineLimit(1)
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 4)
                )
                VStack{
                    Text("Multi")
                        .lineLimit(1)
                    Text(String(format: "%.2f", multiplyer))

                        .lineLimit(1)
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 4)
                )
            
            }
            .offset(y:-(UIScreen.screenHeight * 0.35))
                

            
            Button (action: {
                self.count += multiplyer
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
                    .frame(width: 150, height: 150)
                
            })
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
            Button("Show Sheet") {
                        showingShop.toggle()
                    }
                    .sheet(isPresented: $showingShop,onDismiss: updateShop) {
                        StoreView()
                    }
            
        }
        .offset(y:100)
        ZStack(alignment: .leading){
            Image(ham)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(degree))
        }
        .offset(x:-60,y:120)

        }.offset(y:-40)

        
            
            
        }
    func updateShop(){
        count = UserDefaults.standard.double(forKey: COUNT_KEY)
        ham = UserDefaults.standard.string(forKey: HAMMER_KEY) ?? "Hammer"

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
