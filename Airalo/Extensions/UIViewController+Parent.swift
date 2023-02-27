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
        childViewController.view.frame = containerView.frame
        containerView.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
    }

    func removeChild(_ childViewController: UIViewController) {
        childViewController.willMove(toParent: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParent()
    }
}
