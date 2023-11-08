//
//  URLSessionHTTPClient.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

final class URLSessionHTTPClient: HTTPClient {
    
    private let session: URLSession
    private let requestMaker: URLSessionRequestMaker
    
    init(session: URLSession = .shared, requestMaker: URLSessionRequestMaker) {
        self.session = session
        self.requestMaker = requestMaker
    }
    
    func makeRequest(endpoint: Endpoint, baseURL: String) async -> Result<Data, HTTPClientError> {
        
        if !endpoint.queryParameters.isEmpty {
            
            guard let url = requestMaker.url(endpoint: endpoint, baseURL: baseURL) else {
                return .failure(.badURL)
            }
            
            do {
                let result = try await session.data(from: url)
                
                guard let response = result.1 as? HTTPURLResponse else {
                    return .failure(.responseError)
                }
                
                switch response.statusCode {
                    case 200, 201:
                        return .success(result.0)
                    case 400, 404, 500:
                        guard let result = try? JSONDecoder().decode(ResponseServerError.self, from: result.0) else {
                            return .failure(.parsingError)
                        }
                        return .failure(.serverError(result.message))
                    default:
                        return .failure(.generic)
                }
            } catch {
                return .failure(.generic)
            }
        }
        else {
            guard let url = URL(string: baseURL + endpoint.path) else {
                return .failure(.badURL)
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = endpoint.method.rawValue
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            if let parameters = endpoint.bodyParameters {
                request.httpBody = parameters
            }
            
            do {
                let result = try await session.data(for: request)
                
                guard let response = result.1 as? HTTPURLResponse else {
                    return .failure(.responseError)
                }
                
                switch response.statusCode {
                    case 200, 201:
                        return .success(result.0)
                case 400, 404, 500:
                    guard let result = try? JSONDecoder().decode(ResponseServerError.self, from: result.0) else {
                        return .failure(.parsingError)
                    }
                    return .failure(.serverError(result.message))
                default:
                    return .failure(.generic)
                }
            } catch {
                return .failure(.generic)
            }
        }
    }
}
