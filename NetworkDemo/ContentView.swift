//
//  ContentView.swift
//  NetworkDemo
//
//  Created by Jiaming Guo on 2023-01-18.
//

import Alamofire
import SwiftUI

struct ContentView: View {
    @State private var text = ""
    
    func load() {
        let url = URL(string: "https://raw.githubusercontent.com/j233guo/PostWeibo/main/PostWeibo/Resources/PostListData_recommend_1.json")!
        AF.request(url).responseData { response in
            
        }
    }
    
    func updateText(_ text: String) {
        self.text = text
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
