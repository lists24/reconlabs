//
//  ImageDataModel.swift
//  reconlabsSample
//
//  Created by 크림버드공주 on 2023/05/29.
//

import Foundation
import CoreData
import UIKit

class ImageDataModel : ObservableObject
{
    @Published var data : [ImageData]?
    
    private var context = CoreDataManager.shared.persistentContainer.viewContext
    
    init()
    {
        let request : NSFetchRequest<ImageData> = NSFetchRequest.init(entityName: "ImageData")
        
        do{
            let images : [ImageData] = try context.fetch(request)
            self.data = images
        }
        catch
        {
            print("ImageDataModel Init Error : \(error)")
        }
    }
    
    func saveData(image : UIImage)
    {
        let imageData = ImageData(context: self.context)
        imageData.date = Date()
        imageData.image = image
        
        do{
            try self.context.save()
        }
        catch
        {
            print("Eerror ImageDataModel SaveData : \(error)")
        }
        
        
    }
    
    func getData()
    {
        let fetchRequest = ImageData.fetchRequest()
        
        DispatchQueue.main.async {
            self.data = (try? self.context.fetch(fetchRequest)) ?? []
        }
    }
}
