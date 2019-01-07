//
//  CDAddress+Ext.swift
//  CoreDataPlatform
//
//  Created by TriNgo on 1/1/19.
//  Copyright © 2019 RoverDream. All rights reserved.
//

import Foundation
import CoreData
import Domain
import QueryKit
import RxSwift

extension CDAddress {
    static var city: Attribute<String> { return Attribute("city") }
    static var street: Attribute<String> { return Attribute("street") }
    static var suite: Attribute<String> { return Attribute("suite") }
    static var zipcode: Attribute<String> { return Attribute("zipcode") }
    static var geo: Attribute<String> { return Attribute("geo") }
}

extension CDAddress: DomainConvertibleType {
    func asDomain() -> Address {
        return Address.init(city: city!,
                            geo: (geo?.asDomain())!,
                            street: street!,
                            suite: suite!,
                            zipcode: zipcode!)
    }
}

extension CDAddress: Persistable {
    static var entityName: String {
        return "CDAddress"
    }
    
    static func synced(address: CDAddress, with geo: CDLocation?) -> CDAddress {
        address.geo = geo
        return address
    }
}

extension Address: CoreDataRepresentable {
    internal var uid: String {
        return ""
    }
    
    typealias CoreDataType = CDAddress
    
    func sync(in context: NSManagedObjectContext) -> Observable<CDAddress> {
        let syncSelf = context.rx.sync(entity: self, update: update)
        let syncGeo = geo.sync(in: context).map(Optional.init)
        return Observable.zip(syncSelf, syncGeo, resultSelector: CDAddress.synced)
    }
    
    func update(entity: CDAddress) {
        entity.city = city
        entity.street = street
        entity.suite = suite
        entity.zipcode = zipcode
    }
}
