//
//  AddTopicView.swift
//  KIxit
//
//  Created by Lukas Meinhart on 10.01.24.
//

import SwiftUI

struct AddTitlesView: View {
    
    @EnvironmentObject var gameController: GameController

//    var exhibitionIndex: Int
//
//    var exhibition: Exhibition {
//        gameController.exhibitions[exhibitionIndex]
//    }
//
//    var playerName: String {
//        exhibition.player?.name ?? ""
//    }
    

    
    @State private var currentArtTitle: String = ""
    
    @State private var formMessage: String = ""
    
    var body: some View {
        VStack{
            Text("Hello World")
        }
//        NavigationView {
//            VStack {
//                HStack{
//                    TextField("Title", text: $currentArtTitle)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                    Button(action: {
//                        if(gameController.exhibitions[exhibitionIndex].titles.count < 3) {
//                            guard !self.currentArtTitle.isEmpty else { return }
//
//                            var stringChecker = checkTitlesText(currentArtTitle)
//
//                            if(gameController.exhibitions[exhibitionIndex].titles.contains(currentArtTitle)){
//                                stringChecker = "You already have this title"
//                            }
//
//                            if(stringChecker == "ok"){
//                                gameController.exhibitions[exhibitionIndex].titles.append(currentArtTitle)
//                                formMessage = ""
//                            } else {
//                                formMessage = stringChecker
//                            }
//                        } else {
//                            formMessage = "You can only have 3 art titles"
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                                formMessage = ""
//                            }
//
//                        }
//                        self.currentArtTitle = ""
//
//                    }) {
//                        Image(systemName: "text.badge.plus")
//                            .resizable()
//                            .frame(width: 20, height: 20)
//
//                    }
//                    .padding(.leading, 5)
//
//                }.padding()
//
//                Text(formMessage)
//                    .foregroundColor(.red)
//                    .font(.footnote)
//
//
//
//                List {
//                    ForEach($gameController.exhibitions[exhibitionIndex].titles, id: \.self){
//                        TitleEditRow(title: $0, exhibitionIndex: exhibitionIndex)
//                }
//            }
//
//                // will this work
//                if(gameController.players.count >= 2){
//                    NavigationLink(destination: ExhibitionNamesView()) {
//                        Text("Next")
//                    }
//                }
//
//
//            }.navigationBarTitle("Add Topics to Exhibition")
//
//        }.environmentObject(gameController)
//
        }
    
//    func checkTitlesText(_ string: String) -> String {
//        
//        let passwordRegex = "/^[a-zA-Z0-9]{8,30}$/"
//        if (NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: string)) {
//            return true
//        } else {
//            return false
//            message = "Please enter a valid art title"
//        }
//        
//    }
    
//    @ViewBuilder
//    func chooseDestination() -> some View {
//        switch i {
//        case 0: MatematicaView()
//        case 1: ArteView()
//        default: EmptyView()
//        }
    }




#Preview {
    AddTitlesView()
}
