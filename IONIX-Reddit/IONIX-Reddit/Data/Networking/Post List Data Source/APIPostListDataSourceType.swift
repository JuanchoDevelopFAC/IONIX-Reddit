//
//  APIPostListDataSourceType.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

protocol APIPostListDataSourceType {
    func getPostList() async -> Result<[Post], HTTPClientError>
}
