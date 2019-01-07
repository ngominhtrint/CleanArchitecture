//
//  CDPost+CoreDataProperties.swift
//  
//
//  Created by TriNgo on 1/1/19.
//
//

import Foundation
import CoreData


extension CDPost {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPost> {
        return NSFetchRequest<CDPost>(entityName: "CDPost")
    }

    @NSManaged public var body: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var title: String?
    @NSManaged public var uid: String?
    @NSManaged public var userId: String?

}
