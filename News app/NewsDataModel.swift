//
//  NewsDataModel.swift
//  News app
//
//  Created by Abdusamad Mamasoliyev on 16/11/23.
//

import Foundation

struct NewsApi: Decodable {
    var articles: [Articles]
}

struct Articles: Decodable {
    
    var title: String
    var description: String
    var url: String
    var urlToImage: String?
    var publishedAt: String
    
}
