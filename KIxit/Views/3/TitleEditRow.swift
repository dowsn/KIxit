import SwiftUI

struct TitleEditRow: View {
    
    @EnvironmentObject var gameController: GameController
    
//    var exhibitionIndex: Int
    var title: Title?
    
    var body: some View {
        HStack {
            if let title = title {
                Text(title.name)
                    .foregroundColor(.green)
                Spacer()
                
                Button {
                    
                    
                    
                } label: {
                    Image(systemName: "minus.circle")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
                
            
        }
        .padding()
    }
}

#Preview {
    TitleEditRow(title: Title(name: "Exhibition Name"))
}
