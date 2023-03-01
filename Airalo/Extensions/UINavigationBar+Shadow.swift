//
//  UINavigationBar+Shadow.swift
//  Airalo
//
//  Created by Alex Sarkisov on 01.03.23.
//

import UIKit

extension UINavigationBar {
    
    func addShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowRadius = 30
    }
}
