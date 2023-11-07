//
//  HomeViewModel.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    private let postListUseCase: GetPostListUseCaseType
    
    @Published var showLoadingSpinner: Bool = false
    @Published var showAlert: Bool = false
    @Published var textError: String = ""
    @Published var postList: [Post] = []
    
    init(postListUseCase: GetPostListUseCaseType) {
        self.postListUseCase = postListUseCase
    }
    
    func getPostList() {
        showLoadingSpinner = true
        
        Task {@MainActor in
            let result = await postListUseCase.execute()
            
            switch result {
            case .success:
                let postListResult = try? result.get()
                
                guard let postListResponse = postListResult else {
                    showLoadingSpinner = false
                    print(postListResult!)
                    return
                }
                print(postListResponse)
                showLoadingSpinner = false
                postList = postListResponse
            case .failure(let error):
                print(error)
                showAlert = true
                textError = error.errorPostListDomainDescription
                showLoadingSpinner = false
            }
        }
    }
}
