//
//  GetPostList.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

protocol GetPostListUseCaseType {
    func execute() async -> Result<[Post], PostListDomainError>
}

class GetPostListUseCase: GetPostListUseCaseType {
    
    private let repository: PostListRepositoryType
    
    init(repository: PostListRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Post], PostListDomainError> {
        let result = await repository.getPostList()
        
        guard let postList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            return .failure(error)
        }
        return .success(postList)
    }
}
