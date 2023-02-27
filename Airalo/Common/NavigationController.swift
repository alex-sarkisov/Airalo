//
//  NavigationController.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    private final func initialSetup() {
        view.backgroundColor = .background1
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = .background1
        navigationBarAppearance.shadowColor = .clear
        navigationBarAppearance.largeTitleTextAttributes = [
            .font: UIFont.semiBold(size: 27),
            .foregroundColor: UIColor.content1,
            .kern: -0.5,
        ]
        navigationBar.standardAppearance = navigationBarAppearance
        navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationBar.barTintColor = .background1
        navigationBar.tintColor = .content1
        navigationBar.isTranslucent = false
        navigationBar.prefersLargeTitles = true
        navigationBar.layoutMargins.left = 20
        navigationBar.layoutMargins.right = 20
    }
}
