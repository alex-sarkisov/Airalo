//
//  StoreView.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit

class StoreView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        backgroundColor = .cyan
    }
}
