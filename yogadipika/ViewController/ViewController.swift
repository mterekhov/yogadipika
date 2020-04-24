//
//  ViewController.swift
//  yogadipika
//
//  Created by Michael on 24.04.2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var collectionVC = CollectionVC()

    override func loadView() {
        super.loadView()
        
        createLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionVC.collectionView.reloadData()
    }
    
}

