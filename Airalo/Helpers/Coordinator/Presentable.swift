//
//  Presentable.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit

protocol Presentable: AnyObject {
    
    func toPresent() -> UIViewController?
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}
