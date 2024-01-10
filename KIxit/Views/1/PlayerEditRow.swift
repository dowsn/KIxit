//
//  PlayerEditRow.swift
//  KIxit
//
//  Created by Lukas Meinhart on 08.01.24.
//

import SwiftUI

struct PlayerEditRow: View {
    
    @EnvironmentObject var gameController: GameController
    
    var player: Player?
    
    var body: some View {
        HStack {
            if let player = player {
                Text(player.name)
                    .foregroundColor(player.color)
                Spacer()
                
                Button {
                    print(gameController.players)

                    gameController.players.removeAll(where: { $0.id == player.id })
                    print(gameController.players)
                } label: {
                    Image(systemName: "minus.circle")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
                
            
        }
        .padding()
    }
}

#Preview {
    PlayerEditRow(player: Player(name: "John"))
}
