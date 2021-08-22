//
//  BaseTabBarController.swift
//  AppStoreClone
//
//  Created by Srinivasan Rajendran on 2021-08-19.
//

import UIKit

final class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            createNavController(viewController: AppSearchController(),
                                title: "Search",
                                imageName: "search"),
            createNavController(viewController: UIViewController(),
                                title: "Today",
                                imageName: "today_icon"),
            createNavController(viewController: UIViewController(),
                                title: "Apps",
                                imageName: "apps")]
    }

    private func createNavController(viewController: UIViewController,
                                     title: String,
                                     imageName: String) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(named: imageName)
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }

}
