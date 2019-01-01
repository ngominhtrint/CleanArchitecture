//
//  CommentsNetwork.swift
//  NetworkPlatform
//
//  Created by TriNgo on 12/30/18.
//  Copyright © 2018 RoverDream. All rights reserved.
//

import Domain
import RxSwift

public final class CommentsNetwork {
    private let network: Network<Comment>
    
    init(network: Network<Comment>) {
        self.network = network
    }
    
    public func fetchComments() -> Observable<[Comment]> {
        return network.getItems("comments")
    }
    
    public func fetchComment(commentId: String) -> Observable<Comment> {
        return network.getItem("comments", itemId: commentId)
    }
}
