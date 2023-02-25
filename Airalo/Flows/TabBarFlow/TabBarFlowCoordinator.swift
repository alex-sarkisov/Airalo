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
            startHomeFlow(),
            startEsimsFlow(),
            startProfileFlow()
        ]
        window.rootViewController = module.toPresent()
        window.makeKeyAndVisible()
    }
    
    private func startHomeFlow() -> (Tab, UIViewController) {
        let (controller, coordinator) = coordinatorFactory.makeStoreFlowCoordinator()
        self.add(child: coordinator)
        coordinator.start()
        return (.store, controller)
    }
    
    private func startEsimsFlow() -> (Tab, UIViewController) {
        return (.eSIMs, UIViewController())
    }
    private func startProfileFlow() -> (Tab, UIViewController) {
        return (.profile, UIViewController())
    }
}
