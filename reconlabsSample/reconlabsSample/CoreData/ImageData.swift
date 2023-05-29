//
//  ImageData.swift
//  reconlabsSample
//
//  Created by 크림버드공주 on 2023/05/29.
//

import Foundation
import CoreData
import UIKit

@objc(ImageData)
class ImageData : NSManagedObject
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageData>
    {
        return NSFetchRequest<ImageData>(entityName: "ImageData")
    }
    
    @NSManaged public var image : UIImage?
    @NSManaged public var date : Date?
}

extension ImageData : Identifiable
{
    
}
