//
//  AppDelegate.swift
//  AppStoreClone
//
//  Created by Srinivasan Rajendran on 2021-08-19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureNavigationBarAppearance()
        return true
    }

    private func configureNavigationBarAppearance() {
        let largeTitle = UINavigationBarAppearance()
        largeTitle.configureWithDefaultBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = largeTitle
    }

}

