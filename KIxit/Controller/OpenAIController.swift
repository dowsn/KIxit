//
//  OpenaiChatController.swift
//  KIxit
//
//  Created by Lukas Meinhart on 05.01.24.
//

import Foundation
import SwiftUI
import OpenAIKit



struct ChatM {
    var role: String
    var content: String
}


final class OpenAIController: ObservableObject {
 
    @Published var messages: [ChatM] = []
    
    
    private var openai: OpenAI?
    
    func setup() {
        openai = OpenAI(Configuration(organizationId: "Personal", apiKey: "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"))
    }

    func generateImage(prompt: String) async -> [UIImage] {
        print(prompt)
        guard let openai = openai else { return [] }
        
        do {
            var arrayOfImages: [UIImage] = []
            let params = ImageParameters(prompt: prompt, resolution: .small, responseFormat: .base64Json)
            
            let result = try await openai.createImage(parameters: params)
            let dataArray = result.data
            
            for data in dataArray{
                    let image = data.image
                    let decodedImage = try openai.decodeBase64Image(image)
                    arrayOfImages.append(decodedImage)
            }
            
            return arrayOfImages
            
            
        }
        catch {
            print(String(describing: error))
            return []
        }
        
    }
    
    func generateGalleryNames() async -> String? {
        
        do {
            let chat: [ChatMessage] = [
                
                ChatMessage(role: .system, content: "You are an experienced galerist and you want to open a new exhibition."),
                ChatMessage(role: .user, content: "Give me an original title for exhibition"),
          
            ]
            
            let chatParameters = ChatParameters(
                model: .chatGPTTurbo16k0613,  // ID of the model to use.
                messages: chat  // A list of messages comprising the conversation so far.
            )
            
            let chatCompletion = try await openai?.generateChatCompletion(
                parameters: chatParameters
            )
            
            if let message = chatCompletion?.choices[0].message {
                let content = message.content
                return content
            } else {
                return nil
            }
        } catch {
            print(String(describing: error))
            return nil
        }
    }
    
//    private var openAI: OpenAISwift?
//
//     init() {}
//
//     func setupOpenAI() {
//         let config: OpenAISwift.Config = .makeDefaultOpenAI(apiKey: "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")
//         openAI = OpenAISwift(config: config) // Initialize OpenAI
//     }
//
//
//    func addMessage(_ ChatMessage: ChatM) {
//        messages.append(ChatMessage)
//    }
//
//    func  giveMeThreeExhibitions() async {
//
//            do {
//
//                addMessage(ChatM(role: "system", content: "You are an experienced galerist and you want to open a new exhibition."))
//                addMessage(ChatM(role: "user", content: "Give me three original titles for exhibitions divided by *"))
//
//
//                if let openAI = openAI {
//                    let result = try await openAI.sendChat(with: messages)
//                    print(result)
//
//                    // apend result
//                }
//
//
//
//                // use result
//            } catch {
//                print(error)
////                return nil
//            }
//
//
//    }
    
    

    
    
    
}


