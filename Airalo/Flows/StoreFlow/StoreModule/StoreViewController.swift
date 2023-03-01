//
//  StoreViewController.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit
import SwiftUI

class StoreViewController: UIViewController, ParentViewController {
    
    // MARK: - Private properties
    
    private let loginView = LoginNavigationView()
    private let viewModel: StoreViewModel
    
    // MARK: - Lifecycle
    
    init(viewModel: StoreViewModel) {
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    // MARK: - Private functions
    
    private func initialSetup() {
        edgesForExtendedLayout = .top
        extendedLayoutIncludesOpaqueBars = true
        setupNavigationBar()
        setupSearchBar()
        setupView()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Hello"
        navigationItem.backButtonTitle = ""
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: loginView)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.addShadow()
    }
    
    private func setupSearchBar() {
        navigationItem.searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = false
        let searchTextField = navigationItem.searchController?.searchBar.searchTextField
        searchTextField?.font = .regular(size: 13)
        searchTextField?.textColor = .content2
        searchTextField?.placeholder = "Search data packs for +190 countries and regions"
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.medium(size: 11),
            .foregroundColor: UIColor.content1,
        ]
        let appearance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self])
        appearance.setTitleTextAttributes(attributes, for: .normal)
    }
    
    private func setupView() {
        let rootView = StoreView(viewModel: viewModel, onOffsetChange: setupNavigationBarWithOffset)
        let hostingController = UIHostingController(rootView: rootView)
        addChild(hostingController, to: view)
    }
    
    private func setupNavigationBarWithOffset(_ offset: CGFloat) {
        let shadowOpacity: Float = offset < -45 ? min(-Float(offset + 45) * 0.005, 0.15) : 0
        navigationController?.navigationBar.layer.shadowOpacity = shadowOpacity
        loginView.setAirmoneyHidden(offset < -45)
    }
}
