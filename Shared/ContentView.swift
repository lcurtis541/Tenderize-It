//
//  ContentView.swift
//  Shared
//
//  Created by Landon on 1/6/22.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State var count: Int = 0
    @State var degree: Double = 0
    var body: some View{
        ZStack{
        VStack{
            
            Button (action: {
             
                self.count += 1
                do
                {
                  try Manager.player = AVAudioPlayer.init(contentsOf: returnPathAtSelectedIndex(fileName: "Beat.wav"))
                  //Set required delegates and Values

                  Manager.player?.delegate = self
                  Manager.player?.volume = 1.0
                  Manager.player?.prepareToPlay()
                  Manager.player?.play()
                }
                catch
                {
                  print("Error while playing music: \(error.localizedDescription)")
                }
       

        
                
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
