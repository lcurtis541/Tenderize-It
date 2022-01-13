//
//  ViewModel.swift
//  Tenderize It
//
//  Created by Landon on 1/12/22.
//

import Foundation
import FirebaseFirestore

class ViewModel: ObservableObject {
    
    @Published var list = [LBE]()
    
    private var db = Firestore.firestore()
    
    func fetchData(){
        db.collection("Challenge Leaderboard").addSnapshotListener{ (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else{
                print("No Documents")
                return
            }
            self.list = documents.map{ (queryDocumentSnapshot) -> LBE in
                let data = queryDocumentSnapshot.data()
                
                let name = data["Name"] as? String ?? "Nope"
                let score = data["Score"] as? Int ?? 6
                return LBE(name: name, score: score)
            }
        }
    }
    func setData(enterName: String, enterScore: Int){
        db.collection("Challenge Leaderboard").document().setData([
            "Name": enterName,
            "Score": enterScore]){
                err in
                if let err = err {
                    print("Error writing to database")
                } else{
                    print("Successfuly wrote to database")
                }
            }
    }

}
