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
        return HomeViewModel(postListUseCase: createPostListUseCase(), searchPostListUseCase: createSearchPostUseCase())
    }
    
    private static func createPostListUseCase() -> GetPostListUseCaseType {
        return GetPostListUseCase(repository: createPostListRepository())
    }
    
    private static func createPostListRepository() -> PostListRepositoryType {
        return PostListRepository(
            apiDataSource: createPostListDataSource(),
            errorMapper: PostListDomainErrorMapper())
    }
    
    private static func createPostListDataSource() -> APIPostListDataSourceType {
        return APIPostListDataSource(
            httpClient: createHTTPClient()
        )
    }
    
    private static func createSearchPostUseCase() -> SearchPostListUseCaseType {
        return SearchPostListUseCase(repository: createSearchPostRepository())
    }
    
    private static func createSearchPostRepository() -> SearchPostListRepositoryType {
        return SearchPostListRepository(
            apiDataSource: createSearchPostDataSource(),
            errorMapper: PostListDomainErrorMapper())
    }
    
    private static func createSearchPostDataSource() -> APISearchPostListDataSourceType {
        return APISearchPostListDataSource(httpClient: createHTTPClient())
    }
    
    private static func createHTTPClient() -> URLSessionHTTPClient {
        return URLSessionHTTPClient(requestMaker: URLSessionRequestMaker())
    }
}
