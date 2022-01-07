//
//  Sounds.swift
//  Tenderize It
//
//  Created by Landon on 1/6/22.
//

import UIKit
import AVFoundation

class Sounds: UIViewController{
    var audioPlay = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let soudFile = Bundle.main.url(
            forResource: "Beat Meat",
            withExtension: "mp3")!
        
        do {
            // Play alongside other sounds
            try AVAudioSession.sharedInstance().setCategory(
                AVAudioSession.Category.playback
            )
            try AVAudioSession.sharedInstance().setActive(true)

            audioPlay = try AVAudioPlayer(
                contentsOf: soudFile
            )
            print("In do")
            audioPlay.play()
        } catch {
            print("oops")
        }
    }
    
    @IBAction func drumButtonPRessed(){
        audioPlay.play()
        print("Pressed")
    }
    
}
