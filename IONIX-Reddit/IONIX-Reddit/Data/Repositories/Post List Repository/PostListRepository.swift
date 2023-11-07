//
//  PostListRepository.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

class PostListRepository: PostListRepositoryType {
    
    private let apiDataSource: APIPostListDataSourceType
    private let errorMapper: PostListDomainErrorMapper
    
    init(apiDataSource: APIPostListDataSourceType, errorMapper: PostListDomainErrorMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
    }
    
    func getPostList() async -> Result<[Post], PostListDomainError> {
        let postListResult = await apiDataSource.getPostList()
        
        guard case .success(let posList) = postListResult else {
            return .failure(errorMapper.map(error: postListResult.failureValue as? HTTPClientError))
        }
        
        return .success(posList)
    }
}
