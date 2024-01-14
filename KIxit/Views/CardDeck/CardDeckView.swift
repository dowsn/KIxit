//
//  SwiftUIView.swift
//  KIxit
//
//  Created by Lukas Meinhart on 14.01.24.
//

import SwiftUI

struct CardDeckView: View {
    
    @State private var selectedCard: Int = 3
    
    var body: some View {
        VStack {
            Picker(selection: $selectedCard, label: Text("Play one card")) {
              ForEach(0 ..< 5) { index in
                  Text("Card \(index)")
              }
            }
        }
    }
}

#Preview {
    CardDeckView()
}
