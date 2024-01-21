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
    
    @Published var currentPlayerIndex: Int = 0
    @Published var currentExhibitionIndex: Int = 0
    @Published var currentTitleIndex: Int = 0 // 1 - 3
    
    
    @Published var exhibitions: [Exhibition] = []
    @Published var players: [Player] = []
    


    

    
    // 1) prepare players and exhibitions
    func prepareGame(players: [Player]) {
        for (index, player) in players.enumerated() {
            self.players.append(player)
            exhibitions.append(Exhibition(player: player))
        }
    }
    
    
    // adding topics by each player in a row
    func nextTitleCreation() {
        currentExhibitionIndex = (currentExhibitionIndex + 1) % exhibitions.count
        stepChecker()
        
    }
    
    func stepChecker() {
        if currentExhibitionIndex == exhibitions.count - 1 {
            currentTitleIndex = (currentTitleIndex + 1) % 3
        }
    }
    
    // ROUND exhibition 1 image 1
    // generating images for topic by players except the one that is adding the topic - saving deck
    // selecting images by the same player and then other player plays
    // exhibition player decides, points are given
    
    

    
    
    
    
    // 2) adding Topics
    



    
//    func nextExhibition() {
//        currentExhibition = (currentExhibition + 1) % exhibitions.count
//    }
    
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

