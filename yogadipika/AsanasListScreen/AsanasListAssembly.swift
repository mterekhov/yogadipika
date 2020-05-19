//
//  AsanasListAssembly.swift
//  yogadipika
//
//  Created by Michael on 19.05.2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

class AsanasListAssembly {
    
    public func createModule() -> UIViewController {
        let asanasListVC = AsanasListVC()
        
        let coreDataService = CoreDataService()
        _ = coreDataService.createCoreDataStack()
        
        let asanaService = AsanasService()
        asanaService.coreDataService = coreDataService
        asanasListVC.asanasService = asanaService
        
        return asanasListVC
    }
    
}
