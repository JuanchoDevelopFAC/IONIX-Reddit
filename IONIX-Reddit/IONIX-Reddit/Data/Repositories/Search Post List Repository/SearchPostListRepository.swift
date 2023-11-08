//
//  SearchPostListRepository.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 7/11/23.
//

import Foundation

class SearchPostListRepository: SearchPostListRepositoryType {
    
    private let apiDataSource: APISearchPostListDataSourceType
    private let errorMapper: PostListDomainErrorMapper
    
    init(apiDataSource: APISearchPostListDataSourceType, errorMapper: PostListDomainErrorMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
    }
    
    func search(postName: String) async -> Result<[Post], PostListDomainError> {
        let postListResult = await apiDataSource.searchPostList(postName: postName)
        
        guard case .success(let postList) = postListResult else {
            return .failure(errorMapper.map(error: postListResult.failureValue as? HTTPClientError))
        }
        
        return .success(postList)
    }
    
}
