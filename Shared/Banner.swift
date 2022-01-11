//
//  Banner.swift
//  Tenderize It
//
//  Created by Landon on 1/10/22.
//

import Foundation
import SwiftUI
import GoogleMobileAds

struct Banner: UIViewRepresentable{
    
    var unitID: String
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
        
    }
    func makeUIView(context: Context) -> GADBannerView {
        let adview = GADBannerView(adSize: GADAdSizeBanner)
        adview.adUnitID = unitID
        adview.rootViewController = UIApplication.shared.getRootViewController()
        adview.delegate = context.coordinator
        adview.load(GADRequest())
        return adview
        
    }
    func updateUIView(_ uiView: GADBannerView, context: Context){
        
    }
    class Coordinator: NSObject,GADBannerViewDelegate{
        
    }
}
extension UIApplication{
    func getRootViewController()->UIViewController{
        guard let screen = self.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        return root
    }
}
