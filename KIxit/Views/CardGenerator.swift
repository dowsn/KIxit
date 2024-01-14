//
//  ContentView.swift
//  dixit
//
//  Created by Lukas Meinhart on 23.12.23.
//

import Foundation
import UIKit
import SwiftUI
import OpenAIKit

// generates card and if liked, add to deck
// timer and you use prompt to generate images and create deck

final class ViewModel: ObservableObject {
    
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
    
    func generateGalleryNames() async {
        
        do {
            let chat: [ChatMessage] = [
                
                ChatMessage(role: .system, content: "You are an experienced galerist and you want to open a new exhibition."),
                ChatMessage(role: .user, content: "Give me three original titles for exhibitions divided by *"),
          
            ]
            
            let chatParameters = ChatParameters(
                model: .gpt4,  // ID of the model to use.
                messages: chat  // A list of messages comprising the conversation so far.
            )
            
            let chatCompletion = try await openai?.generateChatCompletion(
                parameters: chatParameters
            )
            
            if let message = chatCompletion?.choices[0].message {
                let content = message.content
                print(content!)
            }
        } catch {
            print(String(describing: error))
        }
    }
    
}

struct CardGenerator: View {
    
    @ObservedObject var viewModel = ViewModel()
    
    @State private var prompt: String = ""
    @State private var imageArray: [UIImage] = []

    
    var body: some View {
        
        NavigationView{
        VStack {
       
            
            Spacer()
            
            Image("chilkoottrail")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 300)
                .clipShape(.rect(cornerRadius: 10))
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.orange, lineWidth: 5) // border
                }
                 .shadow(radius: 10)
            
            if imageArray.count > 0 {
                
        
                ForEach(imageArray, id: \.self){ image in
                        Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay{
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 5) // border
                        }
                         .shadow(radius: 10)
                    }
                } else {
                    Text("Please use prompt to generate image")
                }
         
            
            
            Spacer()
            TextField("Prompt", text: $prompt)
                .padding()
                .textFieldStyle(.roundedBorder)
                .font(Font.system(size: 15, design: .default))
                .multilineTextAlignment(.leading)
                
            
            Button("Generate") {
                Task { // because async
                    imageArray = await viewModel.generateImage(prompt: prompt)
                    print(imageArray.count)
                    prompt = ""
                }
            }
        }
        .navigationTitle("Card Generator")
        .onAppear {
            viewModel.setup() // init model
        }
        }
        .padding()
       
    }
}


struct CardGenerator_Previews: PreviewProvider {
    static var previews: some View {
        CardGenerator()
    }
}

// https://github.com/OpenDive/OpenAIKit

// old code
//struct CardGenerator: View {
//    @State private var imageURL: String = "" // this will change
//    @State private var userInput: String = ""
////    @FocusState private var emailFieldIsFocused: Bool = false
//
//
//
//
//    var body: some View {
//        VStack(alignment: .center, spacing: 12) {
//           VStack(alignment: .center) {
//            AsyncImage(url: URL(string: imageURL))
//                .frame(width: 300, height: 300)
//                .cornerRadius(20)
//                .aspectRatio(contentMode: .fill)
//                .padding()
//                .onAppear {
//                    Task {
//                        await updateImage(userRequest: "fantasy")
//                    }
//                }
//           }
//
//           Spacer()
//           Divider()
//
//
//            VStack(alignment: .center) {
//
//                TextField(
//                    "Enter your idea here",
//                    text: $userInput
//                )
//                .onSubmit {
//                    validate(name: userInput)
//                }
//                .textInputAutocapitalization(.never)
//                .disableAutocorrection(true)
//                //            .padding(1)
//                .frame(width: 200, height: 30, alignment: .center)
//                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .background(Color.white)
//                .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
//
//
//
//
//                Button {
//                    Task {
//                        await updateImage(userRequest: userInput)
//                    }
//                } label: {
//                    Text("Get me random image")
//                }
//                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .padding(6.0)
//                .background(Color.green)
//                .cornerRadius(20)
//                .foregroundColor(.black)
//                .font(.title)
//                .foregroundStyle(.secondary)
//            }
//
//            Spacer()
//
//
//        }
//        .frame(
//              minWidth: 0,
//              maxWidth: .infinity,
//              minHeight: 0,
//              maxHeight: .infinity
//        )
//        .background(Color.yellow)
//
//}
//
//    func updateImage(userRequest: String) async {
//
//        var apiRequest = "https://pixabay.com/api/?key=41425533-854d32d71d659bd63a53470d0&q=" // head of request wit api key
//        let userWord = userRequest.replacingOccurrences(of: " ", with: "+") // replace spaces with +
//        apiRequest += userWord // add user input to request
//        apiRequest += "&image_type=photo" // add image type to request
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: URL(string: apiRequest)!)
//            //all fine with jsonData here
//            let decodedResponse = try? JSONDecoder().decode(CardPicture.self, from: data)
//
//            imageURL = decodedResponse?.hits[0].webformatURL ?? ""
//        } catch {
//            //handle error
//            print(error)
//        }
//    }
//
//    func validate(name: String) {
//        print("Validating name: \(name)")
//    }
//}
