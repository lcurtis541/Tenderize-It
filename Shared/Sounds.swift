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
        // Load a local sound file
            guard let soundFileURL = Bundle.main.url(
                forResource: "Beat Sound",
                withExtension: "mp3"
            ) else {
                return
            }
            
            do {
                // Configure and activate the AVAudioSession
                try AVAudioSession.sharedInstance().setCategory(
                    AVAudioSession.Category.playback
                )

                try AVAudioSession.sharedInstance().setActive(true)

                // Play a sound
                let player = try AVAudioPlayer(
                    contentsOf: soundFileURL
                )

                player.play()
            }
            catch {
                // Handle error
            }
        }
    
}
