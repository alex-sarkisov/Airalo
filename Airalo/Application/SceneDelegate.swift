//
//  SceneDelegate.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private var coordinator: Coordinator?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let coordinatorFactory = CoordinatorFactory()
        let coordinator = coordinatorFactory.makeTabBarFlowCoordinator(windowScene: windowScene)
        coordinator.start()
        
        self.coordinator = coordinator
    }
}

