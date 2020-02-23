//
//  CacheManager.swift
//  News
//
//  Created by Eisuke Tamatani on 1/12/20.
//  Copyright © 2020 Eisuke. All rights reserved.
//

import Foundation

class ChacheManager {
    
    static var imageDictionary = [String:Data]()
    
    static func saveData(_ url:String, _ imageData:Data){
        
        // Save the image data along with the URL
        imageDictionary[url] = imageData
        
    }
    
    static func retrieveData(_ url:String) -> Data? {
        
        // Return the saved image data or nil
        return imageDictionary[url]
        
    }
    
}
