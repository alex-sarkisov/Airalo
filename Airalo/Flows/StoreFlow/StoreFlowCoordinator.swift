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
        let (presentable, module) = moduleFactory.makeStoreModule()
        module.onTapCountry = { [weak self] country in
            self?.showPackagesModule(area: country, areaType: .country)
        }
        module.onTapRegion = { [weak self] region in
            self?.showPackagesModule(area: region, areaType: .region)
        }
        router.setRootModule(presentable)
    }
    
    private func showPackagesModule(area: Area, areaType: AreaType) {
        let module = moduleFactory.makePackagesModule(area: area, areaType: areaType)
        router.push(module)
    }
}
