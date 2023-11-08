//
//  PostListDomainError.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

enum PostListDomainError: Error {
    case serverError(String)
    case generic
    
    var errorPostListDomainDescription: String {
        switch self {
        case .serverError(let message):
            return message
        case .generic:
            return "Unknown error"
        }
    }
}
