//
//  CDComment+Ext.swift
//  CoreDataPlatform
//
//  Created by TriNgo on 1/2/19.
//  Copyright © 2019 RoverDream. All rights reserved.
//

import Foundation
import Domain
import QueryKit
import RxSwift

extension CDComment {
    static var body: Attribute<String> { return Attribute("body") }
    static var email: Attribute<String> { return Attribute("email") }
    static var name: Attribute<String> { return Attribute("name") }
    static var postId: Attribute<String> { return Attribute("postId") }
    static var uid: Attribute<String> { return Attribute("uid") }
}

extension CDComment: DomainConvertibleType {
    func asDomain() -> Comment {
        return Comment(body: body!,
                       email: email!,
                       name: name!,
                       postId: postId!,
                       uid: uid!)
    }
}

extension CDComment: Persistable {
    static var entityName: String {
        return "CDComment"
    }
}

extension Comment: CoreDataRepresentable {
    typealias CoreDataType = CDComment
    
    func update(entity: CDComment) {
        entity.uid = uid
        entity.name = name
        entity.body = body
        entity.email = email
        entity.postId = postId
    }
}
