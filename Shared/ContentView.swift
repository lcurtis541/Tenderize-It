//
//  ContentView.swift
//  Shared
//
//  Created by Landon on 1/6/22.
//

import SwiftUI

struct ContentView: View {
    @State var count: Int = 0
    var body: some View{
        VStack{
            Button (action: {
                Sounds().viewDidLoad()
                Sounds().drumButtonPRessed()
                self.count += 1
                
            },label: {
                Image("steak")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
            })
            Text("Count: \(count)")
        }

        
            
            
    }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {        ContentView()
    }}

class Count: UIViewController {

    var cur = 0;

    @IBOutlet weak var money: UILabel!

    @IBAction func pressbutton(sender: UIButton) {
        cur = Int(money.text!)!;
        self.money.text = String(cur + 1);

    }

}
