//
//  SwiftUIView.swift
//  KIxit
//
//  Created by Lukas Meinhart on 14.01.24.
//

import SwiftUI

struct CardDeckView: View {
    
    @State private var images = [Image]()
    let columns = [GridItem(.fixed(100)), GridItem(.fixed(100))]
    
    @State private var selectedCard: Int = 1
    
    var body: some View {
        VStack{
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(0..<images.count, id: \.self) { index in
                        if(index == selectedCard) {
                            images[index]
                                .resizable()
                                .frame(width: 100, height: 100)
                                .border(Color.green, width: 5)
                                .onTapGesture {
                                    toggleCard(index)
                                }
                        } else {
                            images[index]
                                .resizable()
                                .frame(width: 100, height: 100)
                                .onTapGesture {
                                    toggleCard(index)
                                }
                        }
                     
                        
                    }
                }
                .padding(.horizontal)
                .background(Color.red)
                .scaledToFill()
                
            }
            .frame(maxHeight: 1000)
            .onAppear(perform: loadImages)
            
            Spacer()
            
            Button(action: {
                print("Selected card \(selectedCard)")
            }) {
                Text("Play card")
            }
            
        }
    }
    
    func loadImages() {
        for i in 1...20 {
            let image = Image("KIxitLogo")
            images.append(image)
        }
    }
    
    func toggleCard(_ index: Int) {
        selectedCard = index
    }
}

#Preview {
    CardDeckView()
}
