//
//  AppDelegate.swift
//  Movies
//
//  Created by Ramina Tastanova on 13.11.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let initialViewController = MovieListViewController()
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}
