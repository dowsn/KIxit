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
    
    
    private var apiKey: String {
      get {
        // 1
        guard let filePath = Bundle.main.path(forResource: "Secrets", ofType: "plist") else {
          fatalError("Couldn't find file 'TMDB-Info.plist'.")
        }
        // 2
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "OPENAI_API_KEY") as? String else {
          fatalError("Couldn't find key 'API_KEY' in 'TMDB-Info.plist'.")
        }
        if value.starts(with: "_") || value.isEmpty {
              fatalError(
                "Follow the instructions at https://ai.google.dev/tutorials/setup to get an API key."
              )
        }
        return value
      }
    }
    
    
    private var openai: OpenAI?
    
    func setup() {
        openai = OpenAI(Configuration(organizationId: "Personal", apiKey: apiKey))
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
    
    func saveImage(image: UIImage, as: String) {
       
            if let data = image.pngData() {
                let filename = getDocumentsDirectory().appendingPathComponent("copy.png")
                try? data.write(to: filename)
            }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
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
    
}


