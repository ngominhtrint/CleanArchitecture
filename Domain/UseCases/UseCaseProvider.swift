//
//  UseCaseProvider.swift
//  Domain
//
//  Created by TriNgo on 12/30/18.
//  Copyright © 2018 RoverDream. All rights reserved.
//

import Foundation

public protocol UseCaseProvider {
    
    func makePostsUseCase() -> PostsUseCase
}
