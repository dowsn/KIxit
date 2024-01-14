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
                
                if exhibitions.isEmpty {
                    Text("Loading...")
                } else {
                    List {
                        
                        
                        ForEach(exhibitions){ exhibition in
                            
                            
                            if(exhibition.name != ""){
                                VStack{
                                    Text(exhibition.name).font(.headline)
                                    
                                    if let playername = exhibition.player?.name {
                                        Text(playername).font(.footnote)
                                    }
                                    
                                }.padding()
                            } else {
                                Text("Loading...").padding()
                            }
                            
                            
                        }
                    }
                }
                
                Spacer()
                
                if !gameController.exhibitions.isEmpty {
                    //                    NavigationLink(destination: AddTitlesView()) {
                    Text("Next")
                }
                
                
                
                
                
            }.navigationBarTitle("Exhibition Names")
            
        }.environmentObject(gameController)
            .task {
                
                openai.setup()
                
                for exhibition in gameController.exhibitions{
//                    guard let exhibitionName = await openai.generateGalleryNames() else { break }
                    let exhibitionName = "testname"
                    var updatedExhibition = exhibition
                    updatedExhibition.name = exhibitionName
                    exhibitions.append(updatedExhibition)
                }
                
                
            }
        
        
        
    }
}


    
    



#Preview {
    CreatePlayersViews().environmentObject(GameController())
}
