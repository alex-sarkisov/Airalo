//
//  TabBarController.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit

enum Tab {
    case store
    case eSIMs
    case profile
}

protocol TabBarModule: Presentable {
   
    var submodules: [(Tab, UIViewController)] { get set }
}

class TabBarController: UITabBarController, TabBarModule {
    
    // MARK: - TabBarModule
    
    var submodules: [(Tab, UIViewController)] = [] {
        didSet {
            setupViewControllers(submodules: submodules)
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    // MARK: - Private functions
    
    private func initialSetup() {
        tabBar.isTranslucent = false
        tabBar.tintColor = .content1
        tabBar.barTintColor = .background1
        tabBar.backgroundColor = .background1
    }
    
    private func setupViewControllers(submodules: [(tab: Tab, controller: UIViewController)]) {
        viewControllers = submodules.enumerated().map { index, submodule in
            submodule.controller.tabBarItem = makeTabBarItem(for: submodule.tab, at: index)
            return submodule.controller
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
