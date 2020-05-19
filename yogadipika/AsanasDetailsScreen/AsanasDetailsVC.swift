//
//  AsanasDetailsVC.swift
//  yogadipika
//
//  Created by Michael on 19.05.2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

class AsanasDetailsVC:UIViewController {
    
    public var asanaUUID = ""
    
    private var asana = Asana()
    private let asanaTitleLabel = UILabel(frame: .zero)
    private let asanaIASTLabel = UILabel(frame: .zero)
    private let asanaSanskritTitleLabel = UILabel(frame: .zero)
    private let asanaAboutLabel = UILabel(frame: .zero)
    private var asanaStepsList = [UILabel]()
    private let asanaEffectsLabel = UILabel(frame: .zero)
    private var asanaImagesList = [UIImage]()
    
    override func loadView() {
        super.loadView()
        
        createLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func createLayout() {
        asanaTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(asanaTitleLabel)

        asanaSanskritTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(asanaSanskritTitleLabel)

        asanaIASTLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(asanaSanskritTitleLabel)

        asanaAboutLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(asanaAboutLabel)
        
        asanaEffectsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(asanaEffectsLabel)

        for step in asana.techniqueStepsList {
            let newLabel = UILabel(frame: .zero)
            newLabel.text = step
            newLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(newLabel)
        }
    }
    
}
