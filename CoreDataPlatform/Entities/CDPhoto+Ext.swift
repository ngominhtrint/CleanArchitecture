//
//  CDPhoto+Ext.swift
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

extension CDPhoto {
    static var title: Attribute<String> { return Attribute("title") }
    static var thumbnailUrl: Attribute<String> { return Attribute("thumbnailUrl") }
    static var url: Attribute<String> { return Attribute("url") }
    static var albumId: Attribute<String> { return Attribute("albumId") }
    static var uid: Attribute<String> { return Attribute("uid") }
}

extension CDPhoto: DomainConvertibleType {
    func asDomain() -> Photo {
        return Photo(albumId: albumId!,
                     thumbnailUrl: thumbnailUrl!,
                     title: title!,
                     uid: uid!,
                     url: url!)
    }
}

extension CDPhoto: Persistable {
    static var entityName: String {
        return "CDPhoto"
    }
}

extension Photo: CoreDataRepresentable {
    typealias CoreDataType = CDPhoto
    
    func update(entity: CDPhoto) {
        entity.uid = uid
        entity.title = title
        entity.url = url
        entity.thumbnailUrl = thumbnailUrl
        entity.albumId = albumId
    }
}
