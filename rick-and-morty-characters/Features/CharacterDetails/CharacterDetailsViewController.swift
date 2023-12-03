//
//  CharacterDetailsViewController.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 29/09/23.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    // MARK: - Properties

    private lazy var customView: CharacterDetailsView = {
        let view = CharacterDetailsView()
        view.delegate = self
        return view
    }()

    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // remover depois
    
    let label = UILabel()
    
    func characterDetail(name: String) {
        label.text = name
    }
    
}
 
// MARK: - CharacterDetailsViewDelegate

extension CharacterDetailsViewController: CharacterDetailsViewDelegate {
    
    func didTapAtBackButton() {
        navigationController?.popViewController(animated: true)
    }

}
