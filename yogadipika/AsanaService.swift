//
//  AsanaService.swift
//  yogadipika
//
//  Created by Michael on 24.04.2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

protocol AsanaServiceProtocol {

    func asanasList() -> [Asana]
    
}

class AsanaService:AsanaServiceProtocol {
    
    func asanasList() -> [Asana] {
        var newAsanasList = [Asana]()
        
        guard let catalogURL = Bundle.main.url(forResource: "catalog", withExtension: "json") else {
            return newAsanasList
        }
        
        do {
            let jsonData = try Data(contentsOf: catalogURL)
            guard let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] else {
                    return newAsanasList
            }
            newAsanasList = parseJSON(json:json)
        }
        catch _ {
            
        }
        
        return newAsanasList
    }
    
    private func parseJSON(json:[[String: Any]]) -> [Asana] {
        var newList = [Asana]()
        
        for asanaJSON in json {
            let asanaDict = asanaJSON as [String:Any]
            let newAsana = Asana(title: asanaDict["title"] as! String,
                                 sanskritTitle: asanaDict["sanskrit_title"] as! String,
                                 about: asanaDict["about"] as! String,
                                 techniqueSteps: asanaDict["technique_steps"] as! [String],
                                 effects: asanaDict["effects"] as! String,
                                 imagesList: parseImages(imagesNamesList: asanaDict["images_list"] as! [String]))
            newList.append(newAsana)
        }
        
        return newList
    }

    private func parseImages(imagesNamesList:[String]) -> [UIImage] {
        var imagesList = [UIImage]()
        
        for imageName in imagesNamesList {
            guard let newImage = UIImage(named: imageName) else {
                continue
            }
            imagesList.append(newImage)
        }
        
        return imagesList
    }
    
}
