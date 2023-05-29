//
//  PersistenceController.swift
//  reconlabsSample
//
//  Created by 크림버드공주 on 2023/05/29.
//

import CoreData

struct PersistenceController{
    static let shared = PersistenceController()
    
    let container : NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "CoreDataModel")
        container.loadPersistentStores{
            storeDescription , error in
            
            if let error = error
            {
                fatalError("Container load failed : \(error)")
            }
        }
    }
}
