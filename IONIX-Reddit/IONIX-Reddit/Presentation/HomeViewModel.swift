//
//  HomeViewModel.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    private let postListUseCase: GetPostListUseCaseType
    private let searchPostListUseCase: SearchPostListUseCaseType
    
    @Published var showLoadingSpinner: Bool = false
    @Published var showAlert: Bool = false
    @Published var textError: String = ""
    @Published var postList: [Post] = []
    
    init(postListUseCase: GetPostListUseCaseType, searchPostListUseCase: SearchPostListUseCaseType) {
        self.postListUseCase = postListUseCase
        self.searchPostListUseCase = searchPostListUseCase
    }
    
    func getPostList() {
        showLoadingSpinner = true
        
        Task {@MainActor in
            let result = await postListUseCase.execute()
            handleResult(result)
        }
    }
    
    func search(postName: String) {
        
        if postName == "" {
            getPostList()
        }
        
        Task {@MainActor in
            let result = await searchPostListUseCase.execute(postName: postName.lowercased())
            handleResult(result)
        }
    }
    
    private func handleResult(_ result: Result<[Post], PostListDomainError>) {
        switch result {
            case .success:
                let postListResult = try? result.get()
                
                guard let postListResponse = postListResult else {
                    showLoadingSpinner = false
                    return
                }
                showLoadingSpinner = false
                postList = postListResponse
            case .failure(let error):
                showAlert = true
                textError = error.errorPostListDomainDescription
                showLoadingSpinner = false
        }
    }
}
