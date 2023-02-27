//
//  UIViewController+Parent.swift
//  Airalo
//
//  Created by Alex Sarkisov on 26.02.23.
//

import UIKit

protocol ParentViewController where Self: UIViewController  {
    
    func addChild(_ childViewController: UIViewController, to containerView: UIView)
    
    func removeChild(_ childViewController: UIViewController)
}

extension ParentViewController {
    
    func addChild(_ childViewController: UIViewController, to containerView: UIView) {
        addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            childViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            childViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            childViewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            childViewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        childViewController.didMove(toParent: self)
    }

    func removeChild(_ childViewController: UIViewController) {
        childViewController.willMove(toParent: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParent()
    }
}
