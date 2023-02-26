//
//  StoreFlowModuleFactory.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit

struct StoreFlowModuleFactory {
    
    func makeStoreModule() -> UIViewController {
        let countryService = ServiceFactory.countryService()
        let regionService = ServiceFactory.regionService()
        let viewModel = StoreViewModelImp(countryService: countryService, regionService: regionService)
        let controller = StoreViewController(viewModel: viewModel)
        return controller
    }
}
