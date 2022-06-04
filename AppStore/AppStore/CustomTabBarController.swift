//
//  CustomTabBarController.swift
//  AppStore
//
//  Created by 리아 on 2022/06/04.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.backgroundColor = .darkGray
        tabBar.isTranslucent = true

        let firstViewController = createNavigationView(viewController: ViewController(),
                                                       tabBarTitle: "투데이",
                                                       tabBarImage: "doc.text.image")
        let secondViewController = createNavigationView(viewController: ViewController(),
                                                        tabBarTitle: "게임",
                                                        tabBarImage: "paperplane.fill")
        let thirdViewController = createNavigationView(viewController: ViewController(),
                                                       tabBarTitle: "앱",
                                                       tabBarImage: "square.stack.3d.up.fill")
        let fourthViewController = createNavigationView(viewController: ViewController(),
                                                        tabBarTitle: "Arcade",
                                                        tabBarImage: "gamecontroller.fill")
        let fifthViewController = createNavigationView(viewController: ViewController(),
                                                       tabBarTitle: "검색",
                                                       tabBarImage: "magnifyingglass")

        self.viewControllers = [firstViewController,
                                secondViewController,
                                thirdViewController,
                                fourthViewController,
                                fifthViewController]
    }

    func createNavigationView(viewController: UIViewController,
                              tabBarTitle: String,
                              tabBarImage: String) -> UINavigationController {

        let navigationView = UINavigationController(rootViewController: viewController)

        navigationView.tabBarItem.title = tabBarTitle
        navigationView.tabBarItem.image = UIImage(systemName: tabBarImage)

        return navigationView
    }

}