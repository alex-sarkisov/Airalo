//
//  CoordinatorFactory.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit

struct CoordinatorFactory {
    
    func makeTabBarFlowCoordinator(windowScene: UIWindowScene) -> Coordinator {
        let window = UIWindow(windowScene: windowScene)
        return TabBarFlowCoordinator(window: window,
                                     coordinatorFactory: .init(),
                                     moduleFactory: .init())
    }
    
    func makeStoreFlowCoordinator() -> (UIViewController, Coordinator) {
        let navigationController = UINavigationController()
        let router = BaseRouter(rootController: navigationController)
        let coordinator = StoreFlowCoordinator(router: router, moduleFactory: .init())
        return (navigationController, coordinator)
    }
}
