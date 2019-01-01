//
//  TodosNetwork.swift
//  NetworkPlatform
//
//  Created by TriNgo on 12/30/18.
//  Copyright © 2018 RoverDream. All rights reserved.
//

import Domain
import RxSwift

public final class TodosNetwork {
    private let network: Network<Todo>
    
    init(network: Network<Todo>) {
        self.network = network
    }
    
    public func fetchTodos() -> Observable<[Todo]> {
        return network.getItems("todos")
    }
    
    public func fetchTodo(todoId: String) -> Observable<Todo> {
        return network.getItem("todos", itemId: todoId)
    }
}
