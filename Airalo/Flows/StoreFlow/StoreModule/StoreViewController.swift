//
//  StoreViewController.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit

class StoreViewController: UIViewController {
    
    private let mainView = StoreView()
    private let viewModel: StoreViewModel
    
    init(viewModel: StoreViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
}
