//
//  CDTodo+CoreDataProperties.swift
//  
//
//  Created by TriNgo on 1/1/19.
//
//

import Foundation
import CoreData


extension CDTodo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTodo> {
        return NSFetchRequest<CDTodo>(entityName: "CDTodo")
    }

    @NSManaged public var completed: Bool
    @NSManaged public var title: String?
    @NSManaged public var uid: String?
    @NSManaged public var userId: String?

}
