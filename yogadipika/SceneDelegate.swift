//
//  SceneDelegate.swift
//  yogadipika
//
//  Created by Michael on 24.04.2020.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowsScene = (scene as? UIWindowScene) else {
            return
        }
        
        window = UIWindow(frame: windowsScene.coordinateSpace.bounds)
        window?.windowScene = windowsScene
        
        let mainScreenVC = AsanasListAssembly().createModule()
        let mainScreenNavvc = UINavigationController(rootViewController: mainScreenVC)

        window?.rootViewController = mainScreenVC
        window?.makeKeyAndVisible()
    }

}

