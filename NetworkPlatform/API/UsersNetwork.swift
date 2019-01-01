//
//  UsersNetwork.swift
//  NetworkPlatform
//
//  Created by TriNgo on 12/30/18.
//  Copyright © 2018 RoverDream. All rights reserved.
//

import Domain
import RxSwift

public final class UsersNetwork {
    private let network: Network<User>
    
    init(network: Network<User>) {
        self.network = network
    }
    
    public func fetchUsers() -> Observable<[User]> {
        return network.getItems("users")
    }
    
    public func fetchUser(userId: String) -> Observable<User> {
        return network.getItem("users", itemId: userId)
    }
}
