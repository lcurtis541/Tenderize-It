//
//  ContentView.swift
//  Shared
//
//  Created by Landon on 1/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View{
    Button (action: {
        Sounds().viewDidLoad()
        Sounds().drumButtonPRessed()
    },label: {
        Image("steak")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
    })
        Text("Place")
            .padding(.top, 3.0)
        
            
            
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView()
    }}
