//
//  Tenderize_ItApp.swift
//  Shared
//
//  Created by Landon on 1/6/22.
//

import SwiftUI
import GoogleMobileAds
import Firebase

@main
struct Tenderize_ItApp: App {
    
    init(){
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()

        }
        
    }
    weak var myLabel: UILabel!
    func plus() {

        guard let presentValue = Int(myLabel!.text ?? "0") else { return }

         let newValue = presentValue + 1
         myLabel!.text = String(newValue)
    }

}
