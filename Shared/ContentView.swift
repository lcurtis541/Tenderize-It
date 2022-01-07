//
//  ContentView.swift
//  Shared
//
//  Created by Landon on 1/6/22.
//

import SwiftUI
import AVFoundation

var player:AVAudioPlayer?


struct ContentView: View {
    @State var count: Double = 0
    @State var multiplyer: Double = 1
    @State var degree: Double = 0
    @State var audioPlayer1: AVAudioPlayer!
    @State var audioPlayer2: AVAudioPlayer!
    @State var audioPlayer3: AVAudioPlayer!
    @State var audioCount: Int = 1
    @State var lastHit = Date()
    var body: some View{
        ZStack{
            GeometryReader { geo in
                Image("Kitchen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.top)
                    .clipped()
            }
            
        VStack{
            HStack(spacing:120){
                VStack{
                    Text("Beats")
                        .font(.title)
                    Text(String(format: "%.0f", count))
                        .font(.title)
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 4)
                )
                VStack{
                    Text("Multi")
                        .font(.title)
                    Text(String(format: "%.2f", multiplyer))
                        .font(.title)
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 4)
                )
            
            }
            .offset(y:-320)
                

            
            Button (action: {
                self.count += multiplyer
                switch audioCount{
                case 1:
                    audioPlayer1?.play()
                    audioCount = 2
                case 2:
                    audioPlayer2?.play()
                    audioCount = 3
                case 3:
                    audioPlayer3?.play()
                    audioCount = 1
                default:
                    break
                    
                }
                let diffComponents = Date().timeIntervalSinceReferenceDate-lastHit.timeIntervalSinceReferenceDate
                print(diffComponents)
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
                       }
        }
        .offset(y:100)
        ZStack(alignment: .leading){
            Image("Hammer")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(degree))
        }
        .offset(x:-60,y:120)

        }.offset(y:-40)

        
            
            
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
