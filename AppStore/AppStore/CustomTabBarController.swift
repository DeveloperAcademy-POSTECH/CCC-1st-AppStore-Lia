//
//  CustomTabBarController.swift
//  AppStore
//
//  Created by 리아 on 2022/06/04.
//

import UIKit

class CustomTabBarController: UITabBarController {

    enum TabBarType: CaseIterable {

        case today
        case game
        case app
        case arcade
        case search

        func imageName() -> String {
            switch self {
            case .today:
                return "doc.text.image"
            case .game:
                return "rocket"
            case .app:
                return "square.stack.3d.up.fill"
            case .arcade:
                return "arcade"
            case .search:
                return "magnifyingglass"
            }
        }

        func title() -> String {
            switch self {
            case .today:
                return "투데이"
            case .game:
                return "게임"
            case .app:
                return "앱"
            case .arcade:
                return "Arcade"
            case .search:
                return "검색"
            }
        }

        func viewController() -> UIViewController {
            switch self {
            case .today:
                return TodayViewController()
            case .game:
                return UIViewController()
            case .app:
                return UIViewController()
            case .arcade:
                return UIViewController()
            case .search:
                return UIViewController()
            }
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBarUI()
        setTabBarViewControllers()
    }

    private func setTabBarUI() {
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.backgroundColor = .darkGray
        tabBar.isTranslucent = true
    }

    private func setTabBarViewControllers() {
        let viewControllers = TabBarType.allCases.map {
            return createNavigationVC(viewController: $0.viewController(),
                                      tabBarTitle: $0.title(),
                                      tabBarImage: $0.imageName())
        }
        self.viewControllers = viewControllers
    }

    private func createNavigationVC(viewController: UIViewController,
                                    tabBarTitle: String,
                                    tabBarImage: String) -> UINavigationController {

        let navigationVC = UINavigationController(rootViewController: viewController)

        navigationVC.tabBarItem.title = tabBarTitle
        navigationVC.tabBarItem.image = UIImage(systemName: tabBarImage) ?? UIImage(named: tabBarImage)

        return navigationVC
    }

}
