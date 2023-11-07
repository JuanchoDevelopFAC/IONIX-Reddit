//
//  HTTPClientError.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

enum HTTPClientError: Error {
    case internetConnection
    case serverError(String)
    case generic
    case parsingError
    case badURL
    case responseError
    
    var errorUseDescription: String {
        switch self {
        case .internetConnection:
            return "No internet connection"
        case .serverError(let message):
            return message
        case .generic:
            return "Internal error"
        case .parsingError:
            return "Error in information processing"
        case .badURL:
            return "The URL provided is invalid"
        case .responseError:
            return "Sorry, the request could not be completed"
        }
    }
}

struct ResponseServerError: Codable {
    let message: String
}
