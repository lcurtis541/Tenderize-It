//
//  LeaderBoardEntry.swift
//  Tenderize It
//
//  Created by Landon on 1/12/22.
//

import Foundation

struct LBE: Identifiable, Comparable{
    var id: String = UUID().uuidString
    var name: String
    var score: Int
    
    static func < (lhs: LBE, rhs: LBE) -> Bool{
        return lhs.score > rhs.score
    }
    static func > (lhs: LBE, rhs: LBE) -> Bool{
        return lhs.score < rhs.score
    }
    static func == (lhs: LBE, rhs: LBE) -> Bool{
        return lhs.score == rhs.score
    }
}
