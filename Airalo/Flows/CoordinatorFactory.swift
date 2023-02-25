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
}
