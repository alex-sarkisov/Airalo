//
//  TabBarFlowCoordinator.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit

class TabBarFlowCoordinator: BaseCoordinator {
    
    let window: UIWindow
    let coordinatorFactory: CoordinatorFactory
    let moduleFactory: TabBarModuleFactory
    
    init(window: UIWindow, coordinatorFactory: CoordinatorFactory, moduleFactory: TabBarModuleFactory) {
        self.window = window
        self.coordinatorFactory = coordinatorFactory
        self.moduleFactory = moduleFactory
        super.init()
    }
    
    override func start() {
        showTabBarModule()
    }
    
    private func showTabBarModule() {
        let module = moduleFactory.makeTabBarModule()
        module.submodules = [
        ]
        window.rootViewController = module.toPresent()
        window.makeKeyAndVisible()
    }
}
