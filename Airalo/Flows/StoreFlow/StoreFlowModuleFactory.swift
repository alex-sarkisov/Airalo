//
//  StoreFlowModuleFactory.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit
import SwiftUI

struct StoreFlowModuleFactory {
    
    func makeStoreModule() -> (Presentable, StoreModule) {
        let countryService = ServiceFactory.countryService()
        let regionService = ServiceFactory.regionService()
        let viewModel = StoreViewModel(countryService: countryService, regionService: regionService)
        let controller = StoreViewController(viewModel: viewModel)
        return (controller, viewModel)
    }
    
    func makePackagesModule(area: Area, areaType: AreaType) -> UIViewController {
        let countryService = ServiceFactory.countryService()
        let regionService = ServiceFactory.regionService()
        let viewModel = PackagesViewModel(area: area,
                                          areaType: areaType,
                                          countryService: countryService,
                                          regionService: regionService)
        
        let controller = PackagesViewController(viewModel: viewModel)
        controller.hidesBottomBarWhenPushed = true
        return controller
    }
}
