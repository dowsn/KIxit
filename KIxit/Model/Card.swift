////
////  Card.swift
////  dixit
////
////  Created by Lukas Meinhart on 27.12.23.
////
//
//import Foundation
//import SwiftUI
//
//struct Card: Identifiable {
//    
//    var id = UUID()
//    var prompt: String = "random"
//    var imagePath: String?
//    
//    // init with prompt
//    init (prompt: String) async {
//        self.prompt = prompt
//        self.imagePath = await getImageURL(prompt: prompt) ?? "" // default add LINK if doesn't get object
////        self.image = AsyncImage(url: URL(string: imageURL))
//    }
//    
//    
//    // random image init
//    init () async {
//        self.imagePath = await getImageURL(prompt: prompt) ?? "" // generate random and if fails then add default links
////        self.image = AsyncImage(url: URL(string: imageURL)) // now with "random"
//    }
//    
//    func getImageURL(prompt: String) async -> String? {
//        
//        if(prompt == "random") {
//        }
//        
//        var apiRequest = "https://pixabay.com/api/?key=41425533-854d32d71d659bd63a53470d0&q=" // head of request wit api key
//        let userWord = prompt.replacingOccurrences(of: " ", with: "+") // replace spaces with +
//        apiRequest += userWord // add user input to request
//        apiRequest += "&image_type=photo" // add image type to request
//
//        do {
//                let (data, _) = try await URLSession.shared.data(from: URL(string: apiRequest)!)
//                //all fine with jsonData here
//                let decodedResponse = try? JSONDecoder().decode(CardPicture.self, from: data)
//                
//            return decodedResponse?.hits[0].webformatURL ?? ""
//            } catch {
//                //handle error
//                print(error)
//                return nil
//            }
//        }
//    
//    
//}
//
//
//
