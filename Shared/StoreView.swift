//
//  StoreView.swift
//  Tenderize It
//
//  Created by Landon on 1/7/22.
//

import SwiftUI

struct StoreView: View {
    @State var count: Double = UserDefaults.standard.double(forKey: COUNT_KEY)
    @State var ham: String = UserDefaults.standard.string(forKey: HAMMER_KEY) ?? "Hammer"

    var body: some View {
        VStack{
            HStack{
                Text("The Shop")
                    .font(.title)
                Text(String(format: "%.0f", count))
                    .font(.title)
            }
            List {
                HStack{
                    Image("FuruteHammer")
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                    Text("Future Hammer")
                    Button(action: buyFutureHam){
                        Text("1000")
                    }
                }
            }
            
        }
    }
    func buyFutureHam(){
        if(ham == "FuruteHammer"){
            UserDefaults.standard.set("Hammer", forKey: HAMMER_KEY)
        }
        if(ham=="Hammer"){
            UserDefaults.standard.set("FuruteHammer", forKey: HAMMER_KEY)
        }
        print("In method")
        
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
