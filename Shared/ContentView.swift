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
    @State var count: Int = 0
    @State var degree: Double = 0
    var body: some View{
        ZStack{
        VStack{
            
            Button (action: {
             
                
                self.count += 1
       

        
                
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
                            let urlString = Bundle.main.path(forResource: "Beat", ofType: "wav")
                            do{
                                try AVAudioSession.sharedInstance().setMode(.default)
                                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                                guard let  urlString = urlString else {
                                    return
                                }
                                player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
                                player?.play()
                                
                            } catch{
                                print(error)
                            }
                        })
                        .onEnded({ _ in
                            self.degree = 0
                        })
                )
            Text("Count: \(count)")
        }
        ZStack(alignment: .leading){
            Image("Hammer")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(degree))
        }
        .offset(x:-60,y:-30)

        }

        
            
            
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {        Group {
        ContentView()
        ContentView()
    }
    }}

class Count: UIViewController {

    var cur = 0;

    @IBOutlet weak var money: UILabel!

    @IBAction func pressbutton(sender: UIButton) {
        cur = Int(money.text!)!;
        self.money.text = String(cur + 1);

    }

}
