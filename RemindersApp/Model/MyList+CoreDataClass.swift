//
//  MyList+CoreDataClass.swift
//  RemindersApp
//
//  Created by Sarthak Deshmukh on 02/08/25.
//

import Foundation
import CoreData

@objc(MyList)
public class MyList: NSManagedObject {
    var remindersArray: [Reminder] {
        reminders?.allObjects.compactMap{($0 as! Reminder)} ?? []
    }
}

