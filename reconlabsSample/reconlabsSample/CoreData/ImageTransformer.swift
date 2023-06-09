//
//  ImageTransformer.swift
//  reconlabsSample
//
//  Created by 크림버드공주 on 2023/05/29.
//

import Foundation
import UIKit

class ImageTransformer : ValueTransformer
{
    override func transformedValue(_ value: Any?) -> Any? {
        guard let image = value as? UIImage else { return nil }
        
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: image, requiringSecureCoding: true)
            return data
        }
        catch
        {
            return nil
        }
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        
        guard let data = value as? Data else { return nil }
        
        do
        {
            let image = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: data)
            return image
        }
        catch
        {
            return nil
        }
    }
}
