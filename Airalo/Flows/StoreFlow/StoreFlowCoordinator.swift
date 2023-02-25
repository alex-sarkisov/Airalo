//
//  StoreFlowCoordinator.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import Foundation

class StoreFlowCoordinator: BaseCoordinator {
    
    let router: Router
    let moduleFactory: StoreFlowModuleFactory
    
    init(router: Router, moduleFactory: StoreFlowModuleFactory) {
        self.router = router
        self.moduleFactory = moduleFactory
        super.init()
    }
    
    override func start() {
        showStoreModule()
    }
    
    private func showStoreModule() {
        let module = moduleFactory.makeStoreModule()
        router.setRootModule(module)
    }
}
