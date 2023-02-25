//
//  TabBarController.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit

class TabBarController: UITabBarController {
    
    // MARK: - Private properties
    
    private let tabs: [Tab] = [.store, .eSIMs, .profile]
    
    // MARK: - Lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func initialSetup() {
        tabBar.isTranslucent = false
        tabBar.tintColor = .content1
        tabBar.barTintColor = .background1
        tabBar.backgroundColor = .background1
        viewControllers = makeViewControllers()
    }
    
    private func makeViewControllers() -> [UIViewController] {
        return tabs.enumerated().map {
            let navigationController = UINavigationController()
            navigationController.tabBarItem = makeTabBarItem(for: $1, at: $0)
            return navigationController
        }
    }
    
    private func makeTabBarItem(for tab: Tab, at index: Int) -> UITabBarItem {
        let tabBarInfo: (title: String, imageName: String)
        switch tab {
        case .store:
            tabBarInfo = ("Store", Images.TabBar.store)
        case .eSIMs:
            tabBarInfo = ("My eSIMs", Images.TabBar.eSIMs)
        case .profile:
            tabBarInfo = ("Profile", Images.TabBar.profile)
        }
        let tabBarItem = UITabBarItem(title: tabBarInfo.title,
                                      image: UIImage(named: tabBarInfo.imageName),
                                      tag: index)
        
        tabBarItem.setTitleTextAttributes([.font: UIFont.semiBold(size: 10)], for: .normal)
        return tabBarItem
    }
}

enum Tab {
    case store
    case eSIMs
    case profile
}
