//
//  UseCaseProvider.swift
//  NetworkPlatform
//
//  Created by TriNgo on 1/1/19.
//  Copyright © 2019 RoverDream. All rights reserved.
//

import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {
    private let networkProvider: NetworkProvider
    
    public init() {
        networkProvider = NetworkProvider()
    }
    
    public func makePostsUseCase() -> Domain.PostsUseCase {
        return PostsUseCase.init(network: networkProvider.makePostsNetwork(),
                                 cache: Cache<Post>(path: "allPosts"))
    }
}
