//
//  TenderizeChall.swift
//  Tenderize It
//
//  Created by Landon on 1/12/22.
//

import SwiftUI


struct TenderizeChall: View {
    @State var leaderboardListLenght: Int = 10
    var body: some View {
        List(1..<10) { row in
                HStack{
                    Text("Person")
                    Text("Row \(row)")
                }
            }
        }
    }

struct TenderizeChall_Previews: PreviewProvider {
    static var previews: some View {
        TenderizeChall()
    }
}
