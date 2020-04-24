//
//  ViewController.swift
//  yogadipika
//
//  Created by Michael on 24.04.2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let collectionViewDataSource = CollectionViewDataSource()

    override func loadView() {
        super.loadView()
        
        createLayout()
        
        collectionViewDataSource.collectData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

