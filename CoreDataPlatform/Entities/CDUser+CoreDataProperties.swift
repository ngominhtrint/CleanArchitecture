//
//  CDUser+CoreDataProperties.swift
//  
//
//  Created by TriNgo on 1/1/19.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var uid: String?
    @NSManaged public var username: String?
    @NSManaged public var website: String?
    @NSManaged public var address: CDAddress?
    @NSManaged public var company: CDCompany?

}
