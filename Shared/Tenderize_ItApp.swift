//
//  Tenderize_ItApp.swift
//  Shared
//
//  Created by Landon on 1/6/22.
//

import SwiftUI

@main
struct Tenderize_ItApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
import AVFoundation

var paudioPlayer = AVAudioPlayer()

func playSound() {
        let path = Bundle.main.path(forResource: "Beat.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)

        do {
            //create your audioPlayer in your parent class as a property
            let audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
            print("couldn't load the file")
        }
    }
