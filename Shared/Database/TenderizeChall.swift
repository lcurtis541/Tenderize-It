//
//  TenderizeChall.swift
//  Tenderize It
//
//  Created by Landon on 1/12/22.
//

import SwiftUI


struct TenderizeChall: View {
    @ObservedObject private var viewModel = ViewModel()
    @State var textString = ""

    var body: some View {
        VStack{
            
            List(viewModel.list.sorted()) { itemlbe in
                HStack{
                    Text(itemlbe.name)
                    Text("Score \(itemlbe.score)")
                }
            }
        .onAppear(){
            self.viewModel.fetchData()
        }
            TextField("Name", text: $textString)
            Button("Submit",action: {
                viewModel.setData(enterName: textString, enterScore: UserDefaults.standard.integer(forKey: CHALLENGE_KEY))
            })
    }
    }}

struct TenderizeChall_Previews: PreviewProvider {
    static var previews: some View {
        TenderizeChall()
    }
}
