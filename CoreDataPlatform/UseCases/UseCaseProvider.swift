//
//  UseCaseProvider.swift
//  CoreDataPlatform
//
//  Created by TriNgo on 1/7/19.
//  Copyright © 2019 RoverDream. All rights reserved.
//

import Foundation
import Domain

public final class UseCaseProvider: Domain.UseCaseProvider {
    private let coreDataStack = CoreDataStack()
    private let postRepository: Repository<Post>
    
    public init() {
        postRepository = Repository<Post>(context: coreDataStack.context)
    }
    
    public func makePostsUseCase() -> Domain.PostsUseCase {
        return PostsUseCase(repository: postRepository)
    }
}
