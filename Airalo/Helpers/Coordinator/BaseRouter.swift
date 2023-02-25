//
//  BaseRouter.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit

protocol Router {
    
    func setRootModule(_ module: Presentable?)
    func push(_ module: Presentable?)
    func pop()
}

class BaseRouter: Router {

    private weak var rootController: UINavigationController?
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    // MARK: - Router functions
    
    func setRootModule(_ module: Presentable?) {
        guard let controller = module?.toPresent() else {
            return
        }
        rootController?.setViewControllers([controller], animated: false)
    }
    
    func push(_ module: Presentable?) {
        guard let controller = module?.toPresent(), !(controller is UINavigationController) else {
            return
        }
        rootController?.pushViewController(controller, animated: true)
    }

    func pop() {
        rootController?.popViewController(animated: true)
    }
}
