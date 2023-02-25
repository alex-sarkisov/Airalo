//
//  BaseCoordinator.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import Foundation

protocol Coordinator: AnyObject {
    
    func start()
}

class BaseCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    // MARK: - Coordinator
    
    func start() {
        fatalError("Must be overriden in subclass")
    }
    
    // MARK: - Public
    
    func add(child coordinator: Coordinator) {
        if childCoordinators.contains(where: { $0 === coordinator }) {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    func remove(child coordinator: Coordinator?) {
        guard !childCoordinators.isEmpty, let coordinator = coordinator as? BaseCoordinator else {
            return
        }
        coordinator.childCoordinators.forEach { coordinator.remove(child: $0) }
        childCoordinators.removeAll { $0 === coordinator }
    }
}
