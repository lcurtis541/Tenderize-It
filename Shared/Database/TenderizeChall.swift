//
//  TenderizeChall.swift
//  Tenderize It
//
//  Created by Landon on 1/12/22.
//

import SwiftUI


struct TenderizeChall: View {
    @ObservedObject private var viewModel = ViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State var textString = ""
    @State private var showDialog = true
    @State var showList = false
    @State var subBut = false


    var body: some View {
        VStack{
            HStack{
                Button("Back",action: {
                    UserDefaults.standard.set(0, forKey: CHALLENGE_KEY)
                    self.presentationMode.wrappedValue.dismiss()
                    
                })
                    .buttonStyle(GrowingButton())
                    .alignmentGuide(.leading) {d in d[.leading]}
                    .frame(maxWidth: UIScreen.screenWidth/4)
                Text("Leaderboards")
                    .font(.title)
                    .frame(maxWidth: UIScreen.screenWidth, alignment: .leading)
            }
            Text("Your Score: \(UserDefaults.standard.integer(forKey: CHALLENGE_KEY))")
            HStack{
                TextField("Name", text: $textString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accentColor(.blue)
                          // Text color.
                          .foregroundColor(.blue)
                          // Text/placeholder font.
                          .font(.title.weight(.semibold))
                          // TextField spacing.
                          .padding(.vertical)
                          .padding(.horizontal)
                    Button("Submit",action: {
                        viewModel.setData(enterName: textString, enterScore: UserDefaults.standard.integer(forKey: CHALLENGE_KEY))
                        subBut.toggle()}
                    ).buttonStyle(GrowingButton())
                    .disabled(subBut)
                    }
                           
                .buttonStyle(GrowingButton())
            HStack(spacing:(UIScreen.screenWidth/2)){
              Text("Name")
                Text("Score")
           }
            VStack{
                List(viewModel.list.sorted()) { itemlbe in
                    HStack{
                        Text(itemlbe.name)
                            .alignmentGuide(.leading) {d in d[.leading]}
                            .lineLimit(1)
                        Text("\(itemlbe.score)")
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .alignmentGuide(.trailing) {d in d[.trailing]}
                        }
                    }
                }.id(UUID())
                    .onAppear(){ self.viewModel.fetchData()}
            
        }
    }
}
struct TenderizeChall_Previews: PreviewProvider {
    static var previews: some View {
        TenderizeChall()
    }
}
