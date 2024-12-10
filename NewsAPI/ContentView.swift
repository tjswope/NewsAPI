//
//  ContentView.swift
//  NewsAPI
//
//  Created by Swope, Thomas on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var json = "Loading..."
    
    var body: some View {
        VStack {
            Text(json)
        }
        .task {
            let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2024-11-10&sortBy=publishedAt&apiKey=948d8f533bf6439d94f891fae25ccf45")!
            
               let (data, _) = try! await URLSession.shared.data(from: url)

               json = String(decoding: data, as: UTF8.self)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
