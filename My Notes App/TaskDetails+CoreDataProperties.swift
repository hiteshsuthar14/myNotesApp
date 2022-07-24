//
//  TaskDetails+CoreDataProperties.swift
//  My Notes App
//
//  Created by Hitesh Suthar on 08/07/22.
//
//

import Foundation
import CoreData


extension TaskDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskDetails> {
        return NSFetchRequest<TaskDetails>(entityName: "TaskDetails")
    }
    //Behind the scene the data is stored in more other way ..not like this
    @NSManaged public var color: String?
    @NSManaged public var date: Date?
    @NSManaged public var desc: String?
    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    
//    public var wrappedDate: Date {
//        date ?? Date()
//    }
//
//    public var wrappedTitle: String {
//        title ?? "Unknown Title"
//    }
//
//    public var wrappedDesc: String {
//        desc ?? "Unkown Desc"
//    }

}

extension TaskDetails : Identifiable {

}
