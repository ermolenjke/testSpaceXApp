//
//  SceneDelegate.swift
//  testSpaceXApp
//
//  Created by Даниил Ермоленко on 10.08.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
           
            guard let windowScene = (scene as? UIWindowScene) else { return }
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController =  MainViewController()
//            let menuViewController = UINavigationController(rootViewController: MainViewController())
//            window?.rootViewController = menuViewController
            window?.makeKeyAndVisible()
            window?.overrideUserInterfaceStyle = .light
        }

}

