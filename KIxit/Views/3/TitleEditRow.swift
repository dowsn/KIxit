//import SwiftUI
//
//struct TitleEditRow: View {
//    
//    @EnvironmentObject var gameController: GameController
//    
//    private var artTitle: Title?
//    
//    init(_ artTitle: Title) {
//          self.artTitle = artTitle
//      }
//    
//    var body: some View {
//        HStack {
//            if let title = artTitle {
//                Text(title.name)
//                    .foregroundColor(.green)
//                Spacer()
//                
//                Button {
//                    
//                    
//                } label: {
//                    Image(systemName: "minus.circle")
//                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//                }
//            }
//                
//            
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    TitleEditRow(Title(name: "Exhibition Name"))
//}
