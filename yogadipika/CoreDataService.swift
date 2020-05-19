//
//  CoreDataService.swift
//  booking
//
//  Created by Michael on 02/03/2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import CoreData

protocol CoreDataServiceProtocol {
    
    func createCoreDataStack() -> Bool
    func saveRootContext() -> Bool
    func execute(completionHandler: @escaping ((NSManagedObjectContext) -> Void))
    
}

class CoreDataService: CoreDataServiceProtocol {
    
    private var persistentContainer = NSPersistentContainer(name: "yogadipika")
    private var rootContext:NSManagedObjectContext?
    
    //  MARK: - CTCoreDataServiceProtocol -
    
    func createCoreDataStack() -> Bool {
        var creationError:NSError? = nil
        
        persistentContainer.loadPersistentStores(completionHandler: { (storeDescription, error) in
            creationError = error as NSError?
        })
        
        if creationError != nil {
            return false
        }
        
        self.rootContext = self.persistentContainer.viewContext
        
        return true
    }
    
    func saveRootContext() -> Bool {
        if rootContext!.hasChanges == false {
            return false
        }
        do {
            try rootContext!.save()
        }
        catch let error {
            print("error saving local context to persistant storage - <\(error)>")
            return false
        }
        
        return true
    }
    
    func execute(completionHandler:((NSManagedObjectContext) -> Void)) {
        let localContext = NSManagedObjectContext.init(concurrencyType: .privateQueueConcurrencyType)
        localContext.parent = self.rootContext
        localContext.performAndWait {
            completionHandler(localContext)
            if localContext.hasChanges == false {
                return
            }
            do {
                try localContext.save()
                _ = self.saveRootContext()
            }
            catch let error {
                print("error saving local context to persistant storage - <\(error)>")
            }
        }
    }
    
}
