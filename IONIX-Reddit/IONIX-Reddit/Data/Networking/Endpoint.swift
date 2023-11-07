//
//  Endpoint.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

struct Endpoint {
    let path: String
    let bodyParameters: Data?
    let queryParameters: [String : Any]
    let method: HTTPMethod
}
