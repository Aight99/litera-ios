//
//  SceneDelegate.swift
//  Litera
//
//  Created by ios_developer on 24.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBarController = UITabBarController()
        let tabControllers = [
            FriendsViewController(),
            ExploreViewController(),
            BookmarksViewController(),
        ]
        tabBarController.setViewControllers(tabControllers, animated: false)
        UITabBar.appearance().tintColor = .label
        
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
    }
}

