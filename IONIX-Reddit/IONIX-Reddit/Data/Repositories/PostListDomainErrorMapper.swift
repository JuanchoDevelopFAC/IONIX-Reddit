//
//  PostListDomainErrorMapper.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

struct PostListDomainErrorMapper {
    
    func map(error: HTTPClientError?) -> PostListDomainError {
        switch error {
            case .generic, .parsingError, .badURL, .responseError, .internetConnection, .none:
                return .generic
            case .serverError(let message):
                return .serverError(message)
        }
    }
}
