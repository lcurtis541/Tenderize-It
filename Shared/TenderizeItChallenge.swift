//
//  TenderizeItChallenge.swift
//  Tenderize It
//
//  Created by Landon on 1/12/22.
//
import SwiftUI
import AVFoundation
import Firebase

struct TenderizeItChallenge: View {
    @Environment(\.presentationMode) var presentationMode
    @State var count: Double = 0
    @State var ham: String = "Hammer"
    @State var perHit: Int = 1
    @State private var willMoveToNextScreen = false
    @State private var willMoveToNextScreenEnd = false
    @State var timeLeft: Double = 60
    @State var degree: Double = 0
    @State var audioPlayer1: AVAudioPlayer!
    @State var audioPlayer2: AVAudioPlayer!
    @State var audioPlayer3: AVAudioPlayer!
    @State var audioPlayer4: AVAudioPlayer!
    @State var audioPlayer5: AVAudioPlayer!
    @State var audioPlayer6: AVAudioPlayer!
    @State var audioPlayer7: AVAudioPlayer!
    @State var audioPlayer8: AVAudioPlayer!
    @State var audioPlayer9: AVAudioPlayer!
    @State var audioPlayer10: AVAudioPlayer!
    @State private var showingShop = false
    @State private var showChal = false
    @State var audioCount: Int = 1
    @State var lastHit = Date()
    @State var firstHit: Bool = false
    @State var timeRemaining = 60
    let timer = Timer.publish(every: 1, on: .main, in: .default)
    
    init(){
        _ = timer.connect()
    }
    var body: some View{

        ZStack{
            GeometryReader { geo in
                Image("Background")
                    .resizable()
                    .frame(width: UIScreen.screenWidth * 1.1, height: UIScreen.screenHeight * 1.1)
                    .offset(x: -(UIScreen.screenWidth/20),y:-(UIScreen.screenHeight/10))
            }
            VStack{
                HStack(spacing:(UIScreen.screenWidth/2)){
                    VStack(spacing:(UIScreen.screenWidth/200)){
                        Text("Beats")
                            .lineLimit(1)
                            .font(.system(size: UIScreen.screenWidth/15, design: .rounded))
                            .shadow(color:.gray,radius:2)
                        VStack{
                            Text(String(format: "%.0f", count))
                                .lineLimit(1)
                                .font(.system(size: UIScreen.screenWidth/20, design: .rounded))
                        }
                        .padding()
                        .frame(width:UIScreen.screenWidth/5,height:UIScreen.screenWidth/7)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.blue, lineWidth: 4)
                        )
                    }
                    VStack(spacing:(UIScreen.screenWidth/200)){
                        Text("Time")
                            .lineLimit(1)
                            .font(.system(size: UIScreen.screenWidth/15, design: .rounded))
                            .shadow(color:.gray,radius:2)
                        VStack{
                            Text(String(timeRemaining) + " s")
                                .lineLimit(1)
                                .font(.system(size: UIScreen.screenWidth/20, design: .rounded))
                                .onReceive(timer) { _ in
                                    if ((timeRemaining > 0) && firstHit) {
                                        timeRemaining -= 1
                                    }
                        else if((timeRemaining == 0) && !willMoveToNextScreenEnd && !UserDefaults.standard.bool(forKey: "CDONE")){
                                        UserDefaults.standard.set(Int(count),forKey:CHALLENGE_KEY)
                                        willMoveToNextScreenEnd.toggle()
                                        UserDefaults.standard.set(true,forKey:"CDONE")
                                    }
                                    }
                        }
                        .padding()
                        .frame(width:UIScreen.screenWidth/5,height:UIScreen.screenWidth/7)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.blue, lineWidth: 4))
                            }
                }
                .offset(y:-(UIScreen.screenHeight * 0.375))
                

            
            Button (action: {
                self.count += 1.0
                firstHit = true
                switch audioCount{
                case 1:
                    audioPlayer1?.play()
                    audioCount = 2
                case 2:
                    audioPlayer2?.play()
                    audioCount = 3
                case 3:
                    audioPlayer3?.play()
                    audioCount = 4
                case 4:
                    audioPlayer1?.play()
                    audioCount = 5
                case 5:
                    audioPlayer2?.play()
                    audioCount = 6
                case 6:
                    audioPlayer3?.play()
                    audioCount = 7
                case 7:
                    audioPlayer1?.play()
                    audioCount = 8
                case 8:
                    audioPlayer2?.play()
                    audioCount = 9
                case 9:
                    audioPlayer3?.play()
                    audioCount = 10
                case 10:
                    audioPlayer3?.play()
                    audioCount = 1
                default:
                    break
                    
                }
                lastHit = Date()
                
                    },label: {
                Image("steak")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:UIScreen.screenHeight/5, height: UIScreen.screenHeight/5)
                
            })
                .padding(30)
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged({ _ in
                            self.degree = 60
                            
                        })
                        .onEnded({ _ in
                            self.degree = 0
                        })
                )
                .onAppear {
                    let sound = Bundle.main.path(forResource: "Beat", ofType: "wav")
                    self.audioPlayer1 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer2 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer3 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer4 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer5 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer6 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer7 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer8 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer9 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer10 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                       
                       }
            ZStack(alignment: .leading){
                HStack{
                    Button("Home") {
                            UserDefaults.standard.set(false,forKey:"CDONE")
                            self.presentationMode.wrappedValue.dismiss()
                    }
                            .offset(y:(UIScreen.screenHeight * 0.1))
                            .buttonStyle(GrowingButton())
                }
            }
            
        }
        .offset(y:UIScreen.screenHeight/7)
        ZStack(alignment: .leading){
            Image(ham)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.screenHeight/5, height: UIScreen.screenHeight/5)
                .rotationEffect(.degrees(degree))
        }
        .offset(x:-(UIScreen.screenHeight/13),y:UIScreen.screenHeight/8)

        }.navigate(to: ContentView(), when: $willMoveToNextScreen)
            .navigate(to: TenderizeChall(), when: $willMoveToNextScreenEnd)

        
            
            
        }

        

    }


extension View {
            /// Navigate to a new view.
                               /// - Parameters:
                               ///   - view: View to navigate to.
                               ///   - binding: Only navigates when this condition is `true`.
                               func navigateOG<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
                                   NavigationView {
                                       ZStack {
                                           self
                                               .navigationBarTitle("")
                                               .navigationBarHidden(true)

                                           NavigationLink(
                                               destination: view
                                                   .navigationBarTitle("")
                                                   .navigationBarHidden(true),
                                               isActive: binding
                                           ) {
                                               EmptyView()
                                           }
                                           .onDisappear(){
                                               
                                           }
                                       }
                                   }
                                   .navigationViewStyle(.stack)
                               }
                           }


struct TenderizeItChallenge_Previews: PreviewProvider {
    static var previews: some View {
        TenderizeItChallenge()
    }
}

