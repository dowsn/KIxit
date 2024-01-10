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
                
                if !exhibitions.isEmpty {
                    List {
                        ForEach(exhibitions){ exhibition in
                            Text(exhibition.name)
                        }
                    }
                    
                } else {
                    Text("Loading...")
                }
                
                Spacer()
                
                NavigationLink(destination: CreatePlayersViews()) {
                    Text("Next")
                }
              
                
            }.navigationBarTitle("Exhibition Names")
            
        }.task {
            
            openai.setup()
            
            for _ in 1...3 {
                guard let exhibitionName = await openai.generateGalleryNames() else { break }
                
                print(exhibitionName)
                let newExhibition = Exhibition(name: exhibitionName)
                gameController.exhibitions.append(newExhibition)

            }
            

        }
         .environmentObject(gameController)
        
        
    }

}
    
    



#Preview {
    CreatePlayersViews()
}
