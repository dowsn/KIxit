//
//  OpeningScreen.swift
//  KIxit
//
//  Created by Lukas Meinhart on 06.01.24.
//

import SwiftUI


struct CreatePlayersViews: View {
    
    
    @EnvironmentObject var gameController: GameController
    @State private var players: [Player] = []


    @State private var currentPlayer: String = ""
    @State private var currentColor: Color = Color.black
    
    @State private var isNavigationActive: Bool = false
    @State private var formMessage: String = ""
    

    
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    VStack {
                        
                        TextField("Player name", text: $currentPlayer)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        ColorPicker("Player color", selection: $currentColor)
                        
                    }
                    
                    Button(action: {
                        if(players.count <= 5) {
                            if(checkStringText(currentPlayer) == true) {
                                let newPlayer = Player(name: self.currentPlayer, color: self.currentColor)
                                players.append(newPlayer)
                                formReset()
                            }
                            
                            
                            
                        } else {
                            
                            formThrows(message: "You can only have 6 players")
                            
                        }
                        
                        formReset()
                        
                    }) {
                        Image(systemName: "text.badge.plus")
                    }
                    .padding(.leading, 5)
                    
                }.padding()
                
                Text(formMessage)
                    .foregroundColor(.red)
                    .font(.footnote)
                
                
                VStack{
                    List {
                        ForEach($players) { $player in
                            
                            PlayerEditRow(player: $player)
                            
                        }
                        .onDelete(perform: removePlayer )
                    }
                }
                .toolbar {
                    EditButton()
                }
                
                
                // will this work
                NavigationLink(destination: ExhibitionNamesView(), isActive: $isNavigationActive) {
                    Text("Next")
                }.simultaneousGesture(TapGesture().onEnded{
                    for player in players {
                        gameController.exhibitions.append(Exhibition(player: player))
                    }
                })
                
            }
        
             
            }.navigationBarTitle("Add Players")
            
        }.environmentObject(gameController)
          
        }
                              
     func removePlayer(at offset: IndexSet) {
                    players.remove(atOffsets: offset)
                        
    }
    
    func formReset() {
        self.currentPlayer = ""
        self.currentColor = Color.black
    }
    
    func formThrows(message: String, success: Bool = true) {
        self.formMessage = message
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        self.formMessage = ""
        }
    }

    
    func checkStringText(_ string: String) -> Bool {
        if(string.matches("^[a-zA-Z0-9]{1,10}$")){
            return true
        } else {
            formThrows(message: "Please enter a valid player name")
            return false

        }
    }

    
    
//    private func save() {
//        UserDefaults.standard.set(try? PropertyListEncoder().encode(players), forKey: "players")
//    }
//
//    private func load() {
//        if let data = UserDefaults.standard.value(forKey: "players") as? Data {
//            if let players = try? PropertyListDecoder().decode(Array<Player>.self, from: data) {
//                self.players = players
//            }
//        }
//    }
//
//    private func delete(at offsets: IndexSet) {
//        self.players.remove(atOffsets: offsets)
//        save()
//    }
        
        
}


    
    



#Preview {
    CreatePlayersViews().environmentObject(GameController())
}
