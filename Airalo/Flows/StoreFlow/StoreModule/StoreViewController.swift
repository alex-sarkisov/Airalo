//
//  StoreViewController.swift
//  Airalo
//
//  Created by Alex Sarkisov on 25.02.23.
//

import UIKit

class StoreViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let mainView = StoreView()
    private let viewModel: StoreViewModel
    
    // MARK: - Lifecycle
    
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
        extendedLayoutIncludesOpaqueBars = true
        setupNavigationBar()
        setupSearchBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Hello"
        navigationController?.isNavigationBarHidden = false
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
}
