//
//  KIxitApp.swift
//  KIxit
//
//  Created by Lukas Meinhart on 02.01.24.
//

import SwiftUI


@main
struct KIxitApp: App {
    // object
    @StateObject var gameController = GameController()

    var body: some Scene {
        WindowGroup {
            CreatePlayersViews().environmentObject(GameController())
        }
    }
}
