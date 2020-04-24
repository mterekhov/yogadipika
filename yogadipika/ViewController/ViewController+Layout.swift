//
//  ViewController+Layout.swift
//  yogadipika
//
//  Created by Michael on 24.04.2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

private let SearchBarHeight:CGFloat = 44

extension ViewController {

    func createLayout() {
        let collectionVC = UICollectionViewController()
        collectionVC.collectionView.delegate = self
        collectionVC.collectionView.dataSource = collectionViewDataSource
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
    
}
