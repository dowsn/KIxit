//
//  ContentView.swift
//  dixit
//
//  Created by Lukas Meinhart on 23.12.23.
//

import Foundation
import UIKit
import SwiftUI
import OpenAIKit

// generates card and if liked, add to deck
// timer and you use prompt to generate images and create deck
 
struct CardGenerator: View {

    @ObservedObject var openai = OpenAIController()
    @EnvironmentObject var gameController: GameController
    
    @State private var prompt: String = ""
    @State private var playerIndex = 0
    @State private var imageArray: [UIImage] = []

    
    var body: some View {
        
        NavigationView{
        VStack {
       
            Spacer()
            
            Image("chilkoottrail")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .clipShape(.rect(cornerRadius: 10))
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: 5) // border
                }
                 .shadow(radius: 10)
            
            if imageArray.count > 0 {
                
        
                ForEach(imageArray, id: \.self){ image in
                        Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 5) // border
                        }
                         .shadow(radius: 10)
                    }
                } else {
                    Text("Please use prompt to generate image")
                }
         
            
            
            Spacer()
            TextField("Prompt", text: $prompt)
                .padding()
                .textFieldStyle(.roundedBorder)
                .font(Font.system(size: 15, design: .default))
                .multilineTextAlignment(.leading)
                
            
            Button("Generate") {
                Task { // because async
                    imageArray = await openai.generateImage(prompt: prompt)
                    print(imageArray.count)
                    prompt = ""
                }
            }
            if(imageArray.count > 0){
                Button(action:
                    {
                      var image = Image(uiImage: imageArray[0]);
                      var randomString = AppController().generateRandomString(length: 10)
                    openai.saveImage(image: Image(uiImage: image, as: randomString)
                        var playerDeck = GameController.players[playerIndex].cards
                        var card = Card(image: imageArray[0], prompt: prompt)
                        playerDeck.append(card)
                }) {
                    Text("Save")
                }
                    
                   
                    
                }
            }
        }
        .navigationTitle("Card Generator")
        .onAppear {
            openai.setup() // init model
        }
        }
        .padding()
       
    }.environmentObject(gameController())
    
    
}

}


struct CardGenerator_Previews: PreviewProvider {
    static var previews: some View {
        CardGenerator().environmentObject(GameController())
    }
}


