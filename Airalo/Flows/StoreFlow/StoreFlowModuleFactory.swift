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
        let viewModel = StoreViewModelImp(countryService: countryService)
        let controller = StoreViewController(viewModel: viewModel)
        return controller
    }
}
