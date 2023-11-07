//
//  URLSessionRequestMaker.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

struct URLSessionRequestMaker {
    
    func url(endpoint: Endpoint, baseURL: String) -> URL? {
        var urlComponents = URLComponents(string: baseURL + endpoint.path)
        let urlQueryParameters = endpoint.queryParameters.map { URLQueryItem(name: $0.key, value: "\($0.value)")
        }
        urlComponents?.queryItems = urlQueryParameters
        
        return urlComponents?.url
    }
}
