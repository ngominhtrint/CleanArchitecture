//
//  PostsUseCase.swift
//  Domain
//
//  Created by TriNgo on 12/30/18.
//  Copyright © 2018 RoverDream. All rights reserved.
//

import Foundation
import RxSwift

public protocol PostsUseCase {
    func posts() -> Observable<[Post]>
    func save(post: Post) -> Observable<Void>
    func delete(post: Post) -> Observable<Void>
}
