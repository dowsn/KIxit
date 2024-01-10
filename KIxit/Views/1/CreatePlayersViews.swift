//
//  OpeningScreen.swift
//  KIxit
//
//  Created by Lukas Meinhart on 06.01.24.
//

import SwiftUI


struct CreatePlayersViews: View {
    
    
    @EnvironmentObject var gameController: GameController

    @State private var currentPlayer: String = ""
    @State private var formMessage: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    TextField("Player name", text: $currentPlayer)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        if(gameController.players.count <= 5) {
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
                
                NavigationLink(destination: ExhibitionNamesView()) {
                    Text("Next")
                }
             
            }.navigationBarTitle("Create Players")
            
        }.environmentObject(gameController)
          
        }
        
        
}


    
    



#Preview {
    CreatePlayersViews()
}
