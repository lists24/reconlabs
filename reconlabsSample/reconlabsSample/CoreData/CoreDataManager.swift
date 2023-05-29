//
//  CoreDataManager.swift
//  reconlabsSample
//
//  Created by 크림버드공주 on 2023/05/29.
//

import Foundation
import CoreData

class CoreDataManager
{
    let persistentContainer : NSPersistentContainer
    static let shared : CoreDataManager = CoreDataManager()
    
    private init()
    {
        persistentContainer = NSPersistentContainer(name: "CoreDataModel")
        persistentContainer.loadPersistentStores{
            description , error in
            
            if let error = error
            {
                fatalError("Unalbe to initialize CoreData : \(error)")
            }
        }
    }
}
