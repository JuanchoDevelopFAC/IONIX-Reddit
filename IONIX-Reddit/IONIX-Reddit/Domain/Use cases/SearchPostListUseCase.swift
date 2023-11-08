//
//  SearchPostListUseCase.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 7/11/23.
//

import Foundation

protocol SearchPostListUseCaseType {
    func execute(postName: String) async -> Result<[Post], PostListDomainError>
}

class SearchPostListUseCase: SearchPostListUseCaseType {
    
    private let repository: SearchPostListRepositoryType
    
    init(repository: SearchPostListRepositoryType) {
        self.repository = repository
    }
    
    func execute(postName: String) async -> Result<[Post], PostListDomainError> {
        
        let result = await repository.search(postName: postName)
        
        guard let postList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            return .failure(error)
        }
        return .success(postList)
    }
}
