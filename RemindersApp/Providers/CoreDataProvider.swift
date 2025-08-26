//
//  CoreDataProvider.swift
//  RemindersApp
//
//  Created by Sarthak Deshmukh on 02/08/25.
//

import Foundation
import CoreData

class CoreDataProvider {
    
    static let shared = CoreDataProvider()
    let persistentContainer : NSPersistentContainer
    
    private init() {
        
        // register transformer
        ValueTransformer.setValueTransformer(UIColorTransformer(), forName: NSValueTransformerName("UIColorTransformer"))
        
        persistentContainer = NSPersistentContainer(name: "RemindersModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Error initilaizing RemaindersModel \(error)")
            }
        }
    }
}
