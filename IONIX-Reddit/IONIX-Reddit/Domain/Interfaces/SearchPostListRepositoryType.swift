//
//  SearchPostListRepositoryType.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 7/11/23.
//

import Foundation

protocol SearchPostListRepositoryType {
    func search(postName: String) async -> Result<[Post], PostListDomainError>
}
