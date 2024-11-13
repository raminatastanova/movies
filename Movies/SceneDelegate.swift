//
//  SceneDelegate.swift
//  Movies
//
//  Created by Ramina Tastanova on 13.11.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    internal func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController(rootViewController: MovieListViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
