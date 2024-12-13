//
//  FetchData.swift
//  NewsAPI
//
//  Created by Swope, Thomas on 12/12/24.
//

import Foundation

struct FetchData{
    var response: Response = Response()
    
    mutating func getData() async{
        let URLString = "https://newsapi.org/v2/everything?q=tesla&language =en&from=2024-12-10&sortBy=publishedAt&apiKey=948d8f533bf6439d94f891fae25ccf45"
        
        guard let url = URL(string: URLString) else {return}
        
        guard let(data, _) = try? await URLSession.shared.data(from: url) else {return}
        guard let r = try? JSONDecoder().decode(Response.self, from: data) else {return}
        response = r
        
        let dataString = String(data: data, encoding: .utf8)
        print(dataString ?? " ")
    }
}

struct Response: Codable{
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article] = []
}

struct Article: Codable{
    var title: String?
    var url: String
    var urlToImage: String?
}

extension Article: Identifiable{
    var id: String {title ?? ""}
}
