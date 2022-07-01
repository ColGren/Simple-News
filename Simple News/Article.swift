//
//  Article.swift
//  Simple News
//
//  Created by Colin Grenfell on 01/07/2022.
//

import Foundation

struct Article: Decodable, Identifiable, Comparable {
    
    let id: String
    var section: String
    var title: String
    var description: String
    var author: String
    var text: String
    var thumbnail: URL
    var image:URL
    var date: Date
    var url: URL
    
    static func <(lhs: Article, rhs: Article) -> Bool {
        lhs.date > rhs.date
    }
    
    static let example = Article(id: "1", section: "News", title: "Apple buys Hacking with Swift", description: "What a way to spend $10 million!", author: "Not Paul Hudson", text: "In a move that shocked everyone, especially Tim Cook and Paul Hudson, Apple bought hackingwithswift.com", thumbnail: URL(string: "https://hws.dev/img/logo.png")!, image: URL(string: "https://hws.dev/img/logo.png")!, date: .now, url: URL(string: "https://www.hackingwithswift.com")!)
}
