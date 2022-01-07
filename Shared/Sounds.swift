//
//  Sounds.swift
//  Tenderize It
//
//  Created by Landon on 1/6/22.
//

import UIKit
import AVFoundation

var beatPlayer: AVAudioPlayer?

class Sounds{
    init(){
        let urlString = Bundle.main.path(forResource: "Beat", ofType: "wav")
        do{
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let  urlString = urlString else {
                return
            }
            beatPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            print("intis")

            
        } catch{
            print(error)
        }
    }
    
    func playsSound() {
        beatPlayer?.play()
}
}
