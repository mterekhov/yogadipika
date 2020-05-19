//
//  CollectionVC.swift
//  yogadipika
//
//  Created by Michael on 24.04.2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

class CollectionVC:UICollectionViewController {
    
    private let CollectionViewCellID = "CollectionViewCellID"
    public var asanasList = [Asana]()
    
    override func loadView() {
        super.loadView()

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCellID)
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - UICollectionViewDataSource -

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return asanasList.count;
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellID, for: indexPath)
        newCell.contentView.backgroundColor = .purple
        newCell.backgroundColor = .red
        
        return newCell
    }

    // MARK: - UICollectionViewDelegate -

}
