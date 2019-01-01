//
//  NetworkProvider.swift
//  NetworkPlatform
//
//  Created by TriNgo on 12/30/18.
//  Copyright © 2018 RoverDream. All rights reserved.
//

import Domain

final class NetworkProvider {
    private let apiEndPoint: String
    
    public init() {
        apiEndPoint = "https://jsonplaceholder.typicode.com"
    }
    
    public func makeAlbumsNetwork() -> AlbumsNetwork {
        let network = Network<Album>(apiEndPoint)
        return AlbumsNetwork(network: network)
    }
    
    public func makeCommentsNetwork() -> CommentsNetwork {
        let network = Network<Comment>(apiEndPoint)
        return CommentsNetwork(network: network)
    }
    
    public func makePhotosNetwork() -> PhotosNetwork {
        let network = Network<Photo>(apiEndPoint)
        return PhotosNetwork(network: network)
    }
    
    public func makePostsNetwork() -> PostsNetwork {
        let network = Network<Post>(apiEndPoint)
        return PostsNetwork(network: network)
    }
    
    public func makeTodosNetwork() -> TodosNetwork {
        let network = Network<Todo>(apiEndPoint)
        return TodosNetwork(network: network)
    }
    
    public func makeUsersNetwork() -> UsersNetwork {
        let network = Network<User>(apiEndPoint)
        return UsersNetwork(network: network)
    }
}
