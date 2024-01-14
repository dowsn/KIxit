//
//  UserSettings.swift
//  KIxit
//
//  Created by Lukas Meinhart on 14.01.24.
//

import Foundation

// getters and setters, codable
class UserSettings {
    static let shared = UserSettings()
    
    private init() {}
    
    var userName: String? {
        get {
            return UserDefaults.standard.string(forKey: "userName")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "userName")
        }
    }
    
    var darkModeEnabled: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "darkModeEnabled")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "darkModeEnabled")
        }
    }
    
    // Add more properties and methods for your user settings here
}
