//
//  PlayerEditRow.swift
//  KIxit
//
//  Created by Lukas Meinhart on 08.01.24.
//

import SwiftUI

struct PlayerEditRow: View {
    
    @Binding var player: Player
    
    var body: some View {
        HStack {
        
                Text(player.name)
                    .foregroundColor(player.color)
                
           
                
            
        }
        .padding()
    }
    

}



struct PlayerEditRow_Previews: PreviewProvider {
  static var previews: some View {
      let myPlayer = Player(name: "John")
      PlayerEditRow(player: .constant(myPlayer))
  }
}
