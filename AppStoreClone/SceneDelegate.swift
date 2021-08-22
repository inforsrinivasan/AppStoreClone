//
//  SceneDelegate.swift
//  AppStoreClone
//
//  Created by Srinivasan Rajendran on 2021-08-19.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = BaseTabBarController()
        window?.makeKeyAndVisible()
    }
}

