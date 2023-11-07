//
//  Post.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

struct DataResponse: Codable {
    let data: DataList
}

struct DataList: Codable {
    let children: [ChildData]
}

struct ChildData: Codable {
    let data: Post
}

struct Post: Codable {
    let title: String
    let score: Int
    let author: String
    let numComments: Int
    let url: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case score
        case author
        case numComments = "num_comments"
        case url
        case id
    }
}
