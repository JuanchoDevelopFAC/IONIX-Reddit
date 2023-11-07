//
//  HomeFactory.swift
//  IONIX-Reddit
//
//  Created by Juan Fernando Alvarez Carvajal on 6/11/23.
//

import Foundation

final class HomeFactory {
    
    static func create() -> HomeView {
        return HomeView(homeViewModel: createViewModel())
    }
    
    private static func createViewModel() -> HomeViewModel {
        return HomeViewModel(postListUseCase: createUseCase())
    }
    
    private static func createUseCase() -> GetPostListUseCaseType {
        return GetPostListUseCase(repository: createRepository())
    }
    
    private static func createRepository() -> PostListRepositoryType {
        return PostListRepository(
            apiDataSource: createDataSource(),
            errorMapper: PostListDomainErrorMapper())
    }
    
    private static func createDataSource() -> APIPostListDataSourceType {
        return APIPostListDataSource(
            httpClient: createHTTPClient()
        )
    }
    
    private static func createHTTPClient() -> URLSessionHTTPClient {
        return URLSessionHTTPClient(requestMaker: URLSessionRequestMaker())
    }
}
