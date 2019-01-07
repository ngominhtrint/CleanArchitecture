//
//  CDUser+Ext.swift
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

extension CDUser {
    static var website: Attribute<String> { return Attribute("website") }
    static var email: Attribute<String> { return Attribute("email") }
    static var name: Attribute<String> { return Attribute("name") }
    static var phone: Attribute<String> { return Attribute("phone") }
    static var username: Attribute<String> { return Attribute("username") }
    static var uid: Attribute<String> { return Attribute("uid") }
    static var address: Attribute<String> { return Attribute("address") }
    static var company: Attribute<String> { return Attribute("company") }
}

extension CDUser: DomainConvertibleType {
    func asDomain() -> User {
        return User(address: address!.asDomain(),
                    company: company!.asDomain(),
                    email: email!,
                    name: name!,
                    phone: phone!,
                    uid: uid!,
                    username: username!,
                    website: website!)
    }
}

extension CDUser: Persistable {
    static var entityName: String {
        return "CDUSer"
    }
    
    static func synced(user: CDUser, with address: CDAddress?, company: CDCompany?) -> CDUser {
        user.address = address
        user.company = company
        return user
    }
}

extension User: CoreDataRepresentable {
    typealias CoreDataType = CDUser
    
    func sync(in context: NSManagedObjectContext) -> Observable<CDUser> {
        let syncSelf = context.rx.sync(entity: self, update: update)
        let syncAddress = address.sync(in: context).map(Optional.init)
        let syncCompany = company.sync(in: context).map(Optional.init)
        return Observable.zip(syncSelf, syncAddress, syncCompany, resultSelector: CDUser.synced)
    }
    
    func update(entity: CDUser) {
        entity.uid = uid
        entity.website = website
        entity.email = email
        entity.phone = phone
        entity.username = username
    }
}


