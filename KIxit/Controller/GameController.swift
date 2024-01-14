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
    @Published var themePlayerIndex: Int = 0
//    @Published var players: [Player] = []
    @Published var exhibitions: [Exhibition] = []
    
    // for game
    @Published var currentExhibition: Int = 0
    
    // for topic selection
    @Published var currentPlayer: Int = 0
    
    init() {
//        self.players = players
//        self.themePlayerIndex = players.indices.randomElement()! // first theme player is random
    }
    
    init(players: [Player]) {
//        self.players = players
//        self.themePlayerIndex = players.indices.randomElement()! // first theme player is random
    }
    
    //
    
    func nextExhibition() {
        currentExhibition = (currentExhibition + 1) % exhibitions.count
    }
    
//    func nextPlayer() {
//        currentPlayer = (currentPlayer + 1) % players.count
//    }
    
    func nextPlayerAndTurn() {
        
    }
    
    
//    func resetPlayersCards() async {
//        for var player in players {
////            var randomCard = await generateRandomCard()
//            
////            player.cards.append(randomCard)
//        }
//    }
    
//    func startGame() async {
//        
//        // give initial cards
//        for var player in players {
//            for i in 0...cardsPerPlayer {
//                
////                var randomCard = await generateRandomCard()
//                
////                player.cards.append(randomCard)
//            }
//        }
//    }
    
    
    
}

//Mark: - API

//extension GameModel {
//    
//}

