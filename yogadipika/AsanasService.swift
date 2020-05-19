//
//  AsanaService.swift
//  yogadipika
//
//  Created by Michael on 24.04.2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit
import CoreData

fileprivate let JSONKeyTitle = "title"
fileprivate let JSONKeyIAST = "iast"
fileprivate let JSONKeySanskrit = "sanskrit"
fileprivate let JSONKeyAbout = "about"
fileprivate let JSONKeyEffect = "effect"
fileprivate let JSONKeyTechniqueStepsList = "technique_steps_list"
fileprivate let JSONKeySimilarTitlesList = "similar_titles_list"
fileprivate let JSONKeyImagesList = "images_list"

protocol AsanasServiceProtocol {
    
    func asanasList() -> [Asana]
    func processAsanasLibrary()
    
}

class AsanasService:AsanasServiceProtocol {
    
    public var coreDataService:CoreDataServiceProtocol = CoreDataService()
    
    func processAsanasLibrary() {
        guard let catalogURL = Bundle.main.url(forResource: "catalog", withExtension: "json") else {
            return
        }
        
        do {
            let jsonData = try Data(contentsOf: catalogURL)
            guard let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] else {
                return
            }
            transferJSONIntoCoreData(json:json)
        }
        catch let error {
            print(error)
        }
        
    }
    
    func asanasList() -> [Asana] {
        var newAsanasList = [Asana]()
        
        coreDataService.execute { (localContext) in
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CDAsana")
            do {
                let asanasList = try localContext.fetch(fetchRequest)
                for asana in asanasList as! [CDAsana] {
                    var newAsana = Asana(uuid:"",
                                         title: asana.title ?? "",
                                         sanskritTitle: asana.sanskrit ?? "",
                                         iast: asana.iast ?? "",
                                         about: asana.about ?? "",
                                         techniqueStepsList: asana.techniqueStepsList as! [String],
                                         effect: asana.effect ?? "",
                                         imagesList: self.parseImages(imagesNamesList: asana.imagesList as! [String]))
                    newAsanasList.append(newAsana)
                }
            }
            catch {
                fatalError("Failed to fetch employees: \(error)")
            }
        }
        
        return newAsanasList
    }
    
    private func transferJSONIntoCoreData(json:[[String: Any]]) {
        coreDataService.execute { (localContext) in
            for asanaJSON in json {
                let asanaDict = asanaJSON as [String:Any]
                let newAsana = NSEntityDescription.insertNewObject(forEntityName:"CDAsana", into:localContext) as! CDAsana
                newAsana.title = asanaDict[JSONKeyTitle] as! String
                newAsana.iast = asanaDict[JSONKeyIAST] as! String
                newAsana.sanskrit = asanaDict[JSONKeySanskrit] as! String
                newAsana.about = asanaDict[JSONKeyAbout] as! String
                newAsana.effect = asanaDict[JSONKeyEffect] as! String
                newAsana.techniqueStepsList = asanaDict[JSONKeyTechniqueStepsList] as! [String] as NSObject
                newAsana.similarTitlesList = asanaDict[JSONKeySimilarTitlesList] as! [String] as NSObject
                newAsana.imagesList = asanaDict[JSONKeyImagesList] as! [String] as NSObject
            }
        }
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
