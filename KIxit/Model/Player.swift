//
//  PlayerModel.swift
//  dixit
//
//  Created by Lukas Meinhart on 27.12.23.
//

import Foundation
import SwiftUI
import UIKit

struct Player: Identifiable {
    
    var id = UUID()
    var name: String
    var score: Int = 0
    var color: Color
    var cards: [Card] = []
    
    init(name: String) {
        self.name = name
        self.color = .random
        self.score = 0
       
    }
    
    init(name: String, color: Color) {
        self.name = name
        self.color = color
        self.score = 0
       
    }
    
}

// generate random color
extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}


// making color codable
fileprivate extension Color {
    #if os(macOS)
    typealias SystemColor = NSColor
    #else
    typealias SystemColor = UIColor
    #endif
    
    var colorComponents: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        #if os(macOS)
        SystemColor(self).getRed(&r, green: &g, blue: &b, alpha: &a)
        // Note that non RGB color will raise an exception, that I don't now how to catch because it is an Objc exception.
        #else
        guard SystemColor(self).getRed(&r, green: &g, blue: &b, alpha: &a) else {
            // Pay attention that the color should be convertible into RGB format
            // Colors using hue, saturation and brightness won't work
            return nil
        }
        #endif
        
        return (r, g, b, a)
    }
}

extension Color: Codable {
    enum CodingKeys: String, CodingKey {
        case red, green, blue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let r = try container.decode(Double.self, forKey: .red)
        let g = try container.decode(Double.self, forKey: .green)
        let b = try container.decode(Double.self, forKey: .blue)
        
        self.init(red: r, green: g, blue: b)
    }

    public func encode(to encoder: Encoder) throws {
        guard let colorComponents = self.colorComponents else {
            return
        }
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(colorComponents.red, forKey: .red)
        try container.encode(colorComponents.green, forKey: .green)
        try container.encode(colorComponents.blue, forKey: .blue)
    }
}

struct Card: Identifiable {

    var id = UUID()
    var prompt: String = "random"
    var image: Image
    
    init(prompt: String, image: Image){
        self.prompt = prompt
        self.image = image
    }

    // init with prompt
    init (prompt: String) async {
        self.prompt = prompt
        self.imagePath = await getImageURL(prompt: prompt) ?? "" // default add LINK if doesn't get object
//        self.image = AsyncImage(url: URL(string: imageURL))
    }


    // random image init
    init () async {
        self.imagePath = await getImageURL(prompt: prompt) ?? "" // generate random and if fails then add default links
//        self.image = AsyncImage(url: URL(string: imageURL)) // now with "random"
    }


}

