//
//  ViewController+delegate.swift
//  yogadipika
//
//  Created by Michael on 24.04.2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

class CollectionViewDataSource:NSObject, UICollectionViewDataSource {
    let asanaService:AsanaServiceProtocol = AsanaService()
    var asanasList = [Asana]()

    public func collectData() {
        asanasList = asanaService.asanasList()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return asanasList.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
        
}
