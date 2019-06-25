//
//  DataController.swift
//  Mooskine
//
//  Created by Darwin Bohorquez on 6/24/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    let persistanceContainer : NSPersistentContainer
    
    var viewContext : NSManagedObjectContext {
        return persistanceContainer.viewContext
    }
    
    init(modelName : String) {
        persistanceContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil) {
        persistanceContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                fatalError(error!.localizedDescription)
            }
            completion?()
        }
    }
    
    func save() {
        if viewContext.hasChanges {
            try? viewContext.save()
        }
    }
}
