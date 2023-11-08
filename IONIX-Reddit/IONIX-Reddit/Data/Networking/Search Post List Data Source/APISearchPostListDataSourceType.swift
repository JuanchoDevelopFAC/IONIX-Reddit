//
//  APISearchPostListDataSourceType.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 7/11/23.
//

import Foundation

protocol APISearchPostListDataSourceType {
    func searchPostList(postName: String) async -> Result<[Post], HTTPClientError>
}
