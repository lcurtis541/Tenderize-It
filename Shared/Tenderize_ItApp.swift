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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
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

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool{
        FirebaseApp.configure()
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}
