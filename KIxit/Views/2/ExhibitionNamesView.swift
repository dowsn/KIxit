//
//  ExhibitionNamesView.swift
//  KIxit
//
//  Created by Lukas Meinhart on 09.01.24.
//

import SwiftUI

struct ExhibitionNamesView: View {
    
    
    @EnvironmentObject var gameController: GameController

    @State private var exhibitions: [Exhibition] = []
    @ObservedObject var openai = OpenAIController()
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                if !gameController.exhibitions.isEmpty {
                    List {
                        ForEach(gameController.exhibitions){ exhibition in
                            VStack{
                                Text(exhibition.name).font(.headline)
                                
                                if let playername = exhibition.player?.name {
                                    Text(playername).font(.footnote)
                                }
                                
                            }
                            
                        }
                    }
                    
                } else {
                    Text("Loading...")
                }
                
                Spacer()
                
                if !gameController.exhibitions.isEmpty {
                    NavigationLink(destination: AddTitlesView(exhibitionIndex: 0)) {
                        Text("Next")
                    }
                }
            
        
              
                
            }.navigationBarTitle("Exhibition Names")
            
        }.task {
            
            openai.setup()
            
            for player in gameController.players{
                guard let exhibitionName = await openai.generateGalleryNames() else { break }
                
                print(exhibitionName)
                let newExhibition = Exhibition(name: exhibitionName, player: player)
                gameController.exhibitions.append(newExhibition)
            }
            

        }
         .environmentObject(gameController)
        
        
    }

}
    
    



#Preview {
    CreatePlayersViews()
}
