//
//  ViewController+Layout.swift
//  yogadipika
//
//  Created by Michael on 24.04.2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

private let SearchBarHeight:CGFloat = 44
private let FlowSpacing:CGFloat = 8
private let CellsCountPerRow:CGFloat = 4

extension ViewController {
    
    func createLayout() {
        collectionVC = CollectionVC(collectionViewLayout:createCollectionViewFlow())
        collectionVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionVC.view)
        addChild(collectionVC)
        
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: SearchBarHeight),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            collectionVC.view.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            collectionVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func createCollectionViewFlow() -> UICollectionViewFlowLayout {
        let newFlow = UICollectionViewFlowLayout()

        let cellSize = CGFloat(Float((view.bounds.width - FlowSpacing * (CellsCountPerRow - 1)) / CellsCountPerRow).rounded(.towardZero))
        newFlow.itemSize = CGSize(width: cellSize, height: cellSize)
        newFlow.minimumLineSpacing = FlowSpacing
        newFlow.minimumInteritemSpacing = 0
        newFlow.sectionInset = UIEdgeInsets.init(top: FlowSpacing, left: FlowSpacing, bottom: FlowSpacing, right: FlowSpacing)
        
        return newFlow
    }
    
}
