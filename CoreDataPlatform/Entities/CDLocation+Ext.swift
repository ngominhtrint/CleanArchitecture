//
//  CDLocation+Ext.swift
//  CoreDataPlatform
//
//  Created by TriNgo on 1/2/19.
//  Copyright © 2019 RoverDream. All rights reserved.
//

import Foundation
import CoreData
import Domain
import QueryKit

extension CDLocation {
    static var latitude: Attribute<Double> { return Attribute("latitude") }
    static var longitude: Attribute<Double> { return Attribute("longitude") }
    static var name: Attribute<String> { return Attribute("name") }
    static var post: Attribute<String> { return Attribute("post") }
}

extension CDLocation: DomainConvertibleType {
    func asDomain() -> Location {
        return Location(latitude: latitude, longitude: longitude)
    }
}

extension CDLocation: Persistable {
    static var entityName: String {
        return "CDLocation"
    }
}

extension Location: CoreDataRepresentable {
    internal var uid: String {
        return "";
    }
    
    typealias CoreDataType = CDLocation
    
    func update(entity: CDLocation) {
        entity.latitude = latitude
        entity.longitude = longitude
    }
}
