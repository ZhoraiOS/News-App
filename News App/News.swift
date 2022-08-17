//
//  News.swift
//  News App
//
//  Created by Zhora Babakhanyan on 8/17/22.
//

import Foundation

struct News: Decodable{
    let totalResults :  Int
    let articles: [Articles]
}

struct Articles: Decodable{
   let title: String
   let publishedAt: String
   let urlToImage: String
   let description: String?
   let content: String?
   let url: String
}
