//
//  APIPostListDataSource.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

class APIPostListDataSource: APIPostListDataSourceType {
    
    private let baseURL: String = "https://www.reddit.com/"
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    private let queryParameters: [String : Any] = [
        "limit": 10,
    ]
    
    func getPostList() async -> Result<[Post], HTTPClientError> {
        let endpoint: Endpoint = Endpoint(
            path: "r/memes/.json",
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
