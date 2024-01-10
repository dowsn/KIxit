//
//  GameModel.swift
//  KIxit
//
//  Created by Lukas Meinhart on 02.01.24.
//

import Foundation
import SwiftUI

class GameController: ObservableObject {
    
    var id = UUID()
    var cardsPerPlayer: Int = 4
    @Published var turnNumber: Int = 1
    @Published var themePlayerIndex: Int = 0
    @Published var players: [Player] = []
    @Published var exhibitions: [Exhibition] = []
    
    init() {
//        self.players = players
//        self.themePlayerIndex = players.indices.randomElement()! // first theme player is random
    }
    
    init(players: [Player]) {
//        self.players = players
//        self.themePlayerIndex = players.indices.randomElement()! // first theme player is random
    }
    
    func nextTurn() {
        turnNumber += 1
        themePlayerIndex = (themePlayerIndex) % players.count
    }
    
    func resetPlayersCards() async {
        for var player in players {
//            var randomCard = await generateRandomCard()
            
//            player.cards.append(randomCard)
        }
    }
    
    func startGame() async {
        
        // give initial cards
        for var player in players {
            for i in 0...cardsPerPlayer {
                
//                var randomCard = await generateRandomCard()
                
//                player.cards.append(randomCard)
            }
        }
    }
    
    
    
}

//Mark: - API

//extension GameModel {
//    
//}

