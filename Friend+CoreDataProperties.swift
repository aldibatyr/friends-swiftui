//
//  Friend+CoreDataProperties.swift
//  
//
//  Created by Aldiyar Batyrbekov on 6/10/20.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Person?

}
