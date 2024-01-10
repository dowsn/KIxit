//
//  AddTopicView.swift
//  KIxit
//
//  Created by Lukas Meinhart on 10.01.24.
//

import SwiftUI

struct AddTopicView: View {
    
    @EnvironmentObject var gameController: GameController

    var exhibition: Exhibition
    var playerName: String {
        if let player = exhibition.player {
            return player.name
        }
    }
    
    @State private var currentArtName: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    TextField("Art pieace titles", text: currentArtName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        if(gameController.players.count <= 3) {
                            guard !self.currentPlayer.isEmpty else { return }
                            let newPlayer = Player(name: self.currentPlayer)
                            gameController.players.append(newPlayer)
                            formMessage = ""
                        } else {
                            formMessage = "You can only have 6 players"
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            formMessage = ""
                        }
 
                    }
                        self.currentPlayer = ""

                    }) {
                        Image(systemName: "text.badge.plus")
                    }
                    .padding(.leading, 5)
                    
                }.padding()
                
                Text(formMessage)
                    .foregroundColor(.red)
                    .font(.footnote)
                
             
                
                List {
                    ForEach($gameController.players) { $player in
                                                
                        PlayerEditRow(player: player).environmentObject(gameController)

                    }
                }
                
                // will this work
                if(gameController.players.count >= 2){
                    NavigationLink(destination: ExhibitionNamesView()) {
                        Text("Next")
                    }
                }
             
             
            }.navigationBarTitle("Create Players")
            
        }.environmentObject(gameController)
          
        }
    
//    @ViewBuilder
//    func chooseDestination() -> some View {
//        switch i {
//        case 0: MatematicaView()
//        case 1: ArteView()
//        default: EmptyView()
//        }
//    }
}

#Preview {
    AddTopicView()
}
