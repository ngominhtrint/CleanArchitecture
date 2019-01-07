//
//  CDAlbum+Ext.swift
//  CoreDataPlatform
//
//  Created by TriNgo on 1/2/19.
//  Copyright © 2019 RoverDream. All rights reserved.
//

import Foundation
import CoreData
import Domain
import QueryKit
import RxSwift

extension CDAlbum {
    static var title: Attribute<String> { return Attribute("title") }
    static var userId: Attribute<String> { return Attribute("userId") }
    static var uid: Attribute<String> { return Attribute("uid") }
}

extension CDAlbum: DomainConvertibleType {
    func asDomain() -> Album {
        return Album(title: title!,
                     uid: uid!,
                     userId: userId!)
    }
}

extension CDAlbum: Persistable {
    static var entityName: String {
        return "CDAlbum"
    }
}

extension Album: CoreDataRepresentable {
    typealias CoreDataType = CDAlbum
    
    func update(entity: CDAlbum) {
        entity.uid = uid
        entity.title = title
        entity.userId = userId
    }
}
