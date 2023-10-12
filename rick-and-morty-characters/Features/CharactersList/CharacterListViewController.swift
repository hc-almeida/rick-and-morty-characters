//
//  CharacterListViewController.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 28/09/23.
//

import UIKit

class CharacterListViewController: UIViewController {
    
    // MARK: - Properties

    private lazy var customView: CharacterListView = {
        let view = CharacterListView(self)
        return view
    }()

    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        setupNavigation()
    }
    
    // MARK: - Private Methods
    
    private func setupNavigation() {
        navigationItem.title = "Characters"
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController()
        searchController.searchBar.searchTextField.textColor = .Others.color7
//        searchController.searchResultsUpdater = self
//        searchController.searchBar.delegate = self
        searchController.searchBar.tintColor = .black
        searchController.searchBar.barStyle = .black
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "What character are you looking for?", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray.withAlphaComponent(0.6)])
        searchController.searchBar.searchTextField.leftView?.tintColor = .Others.color7
        
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }

}

extension CharacterListViewController: CharacterListViewDelegate {
   
    func selectCharacter(at index: Int) {
        let viewController = CharacterDetailsViewController()
        viewController.characterDetail(name: DataChacter[index].name)
        navigationController?.pushViewController(viewController, animated: true)
    }

}
