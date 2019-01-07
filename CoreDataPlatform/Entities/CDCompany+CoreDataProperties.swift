//
//  CDCompany+CoreDataProperties.swift
//  
//
//  Created by TriNgo on 1/1/19.
//
//

import Foundation
import CoreData


extension CDCompany {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCompany> {
        return NSFetchRequest<CDCompany>(entityName: "CDCompany")
    }

    @NSManaged public var bs: String?
    @NSManaged public var catchPhrase: String?
    @NSManaged public var name: String?
    @NSManaged public var user: CDUser?

}
