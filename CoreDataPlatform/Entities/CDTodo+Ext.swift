//
//  CDTodo+Ext.swift
//  CoreDataPlatform
//
//  Created by TriNgo on 1/7/19.
//  Copyright © 2019 RoverDream. All rights reserved.
//

import Foundation
import CoreData
import Domain
import QueryKit
import RxSwift

extension CDTodo {
    static var title: Attribute<String> { return Attribute("title") }
    static var completed: Attribute<Bool> { return Attribute("completed") }
    static var userId: Attribute<String> { return Attribute("userId") }
    static var uid: Attribute<String> { return Attribute("uid") }
}

extension CDTodo: DomainConvertibleType {
    func asDomain() -> Todo {
        return Todo(completed: completed,
                    title: title!,
                    uid: uid!,
                    userId: userId!)
    }
}

extension CDTodo: Persistable {
    static var entityName: String {
        return "CDTodo"
    }
}

extension Todo: CoreDataRepresentable {
    typealias CoreDataType = CDTodo
    
    func update(entity: CDTodo) {
        entity.uid = uid
        entity.completed = completed
        entity.title = title
        entity.userId = userId
    }
}
