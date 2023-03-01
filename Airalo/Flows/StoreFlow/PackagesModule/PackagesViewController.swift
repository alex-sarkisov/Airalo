//
//  PackagesViewController.swift
//  Airalo
//
//  Created by Alex Sarkisov on 28.02.23.
//

import UIKit
import SwiftUI

class PackagesViewController: UIViewController, ParentViewController {
    
    // MARK: - Private properties
    
    private let viewModel: PackagesViewModel
    
    // MARK: - Lifecycle
    
    init(viewModel: PackagesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    // MARK: - Private functions
    
    private func initialSetup() {
        edgesForExtendedLayout = .top
        extendedLayoutIncludesOpaqueBars = true
        setupNavigationBar()
        setupView()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = viewModel.navigationTitle
        navigationController?.navigationBar.addShadow()
    }
    
    private func setupView() {
        let rootView = PackagesView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: rootView)
        addChild(hostingController, to: view)
    }
}
