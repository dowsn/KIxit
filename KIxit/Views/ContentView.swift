//
//  ContentView.swift
//  KIxit
//
//  Created by Lukas Meinhart on 02.01.24.
//

import SwiftUI



struct ContentView: View {
    
    
    
    @State private var numberOfPlayers: Float = 1
    
    
    var body: some View {
        
        
        
        NavigationSplitView{
       
            
            VStack {
                Text(String(format: "%.0f", numberOfPlayers))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Slider(
                    value: $numberOfPlayers,
                    in: 1...6,
                    step: 1,
                    onEditingChanged: { editing in
                        print("Slider editing changed: \(numberOfPlayers)")
                    }
                    
                )
                .padding()
                .accentColor(.red)
                .foregroundColor(.red)
                
                Button("Start Game") {
                    NavigationLink(destination: ContentView()) {
                        Text("Start Game")
                    }
                }
                
                
            }
            .navigationTitle("Number of Players")

        } detail: {
            Text("Select Number of Players") // placeholder that appears when someone makes selection - mainly iPad
        }
    }
}

#Preview {
    ContentView()
}
