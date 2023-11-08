//
//  APISearchPostListDataSource.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 7/11/23.
//

import Foundation

class APISearchPostListDataSource: APISearchPostListDataSourceType {
    
    private let baseURL: String = "https://www.reddit.com/"
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    private var queryParameters: [String : Any] = [
        "limit": 100,
        "post_hint": "image",
        "link_flair_text": "Shitposting"
    ]
    
    func searchPostList(postName: String) async -> Result<[Post], HTTPClientError> {
        
        queryParameters["q"] = postName
        
        let endpoint: Endpoint = Endpoint(
            path: "r/memes/search.json",
            bodyParameters: nil,
            queryParameters: queryParameters,
            method: .get)
        
        let result = await httpClient.makeRequest(endpoint: endpoint, baseURL: baseURL)
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failureValue as? HTTPClientError))
        }
        
        do {
            let response = try JSONDecoder().decode(DataResponse.self, from: data)
            
            let postList = response.data.children.map { $0.data }
            
            return .success(postList)
            
        } catch {
            return .failure(.parsingError)
        }

    }
    
    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else {
            return .generic
        }
        
        return error
    }
}
