//
//  ContentView.swift
//  NetworkDemo
//
//  Created by Jiaming Guo on 2023-01-18.
//

import SwiftUI

struct ContentView: View {
    @State private var text = ""
    
    func load() {
        NetworkAPI.hotPostList { result in
            switch result {
            case let .success(list):
                updateText("Post count \(list.list.count)")
            case let .failure(error):
                updateText(error.localizedDescription)
            }
        }
    }
    
    func updateText(_ text: String) {
        DispatchQueue.main.async {
            self.text = text
        }
    }
    
    var body: some View {
        VStack {
            Text(text)
                .font(.title)
            
            Button {
                load()
            } label: {
                Text("Start")
                    .font(.largeTitle)
            }
            
            Button {
                text = ""
            } label: {
                Text("Clear")
                    .font(.largeTitle)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
