//
//  LeaderBoardEntry.swift
//  Tenderize It
//
//  Created by Landon on 1/12/22.
//

import Foundation

struct LBE: Identifiable{
    var id: String = UUID().uuidString
    var name: String
    var score: Int
}
