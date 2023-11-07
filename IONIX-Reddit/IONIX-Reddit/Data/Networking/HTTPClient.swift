//
//  HTTPClient.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

protocol HTTPClient {
    func makeRequest(endpoint: Endpoint, baseURL: String) async -> Result<Data, HTTPClientError>
}
