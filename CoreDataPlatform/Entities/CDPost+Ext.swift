//
//  CDPost+Ext.swift
//  CoreDataPlatform
//
//  Created by TriNgo on 1/3/19.
//  Copyright © 2019 RoverDream. All rights reserved.
//

import Foundation
import CoreData
import Domain
import QueryKit
import RxSwift

extension CDPost {
    static var title: Attribute<String> { return Attribute("title") }
    static var body: Attribute<String> { return Attribute("body") }
    static var userId: Attribute<String> { return Attribute("userId") }
    static var uid: Attribute<String> { return Attribute("uid")}
    static var createdAt: Attribute<String> { return Attribute("createdAt")}
}

extension CDPost: DomainConvertibleType {
    func asDomain() -> Post {
        return Post(body: body!,
                    title: title!,
                    uid: uid!,
                    userId: userId!,
                    createdAt: createdAt!)
    }
}

extension CDPost: Persistable {
    static var entityName: String {
        return "CDPost"
    }
}

extension Post: CoreDataRepresentable {
    typealias CoreDataType = CDPost
    
    func update(entity: CDPost) {
        entity.uid = uid
        entity.title = title
        entity.body = body
        entity.userId = userId
        entity.createdAt = createdAt
    }
}
