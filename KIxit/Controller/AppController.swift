//
//  AppController.swift
//  KIxit
//
//  Created by Lukas Meinhart on 22.01.24.
//

import Foundation

class AppController {
    
    func generateRandomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
