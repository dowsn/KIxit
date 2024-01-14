//
//  Exhibition.swift
//  KIxit
//
//  Created by Lukas Meinhart on 09.01.24.
//

import Foundation

struct Exhibition: Identifiable {
    let id = UUID()
    var name: String = ""
    let player: Player?
    var titles: [String] = []

}


