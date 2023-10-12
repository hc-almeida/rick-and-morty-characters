//
//  OnboardingViewController.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 25/09/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Properties

    private lazy var customView: OnboardingView = {
        let view = OnboardingView(delegate: self)
        return view
    }()

    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backButtonTitle = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

}

extension OnboardingViewController: OnboardingViewDelegate {
   
    func onSeeCharactersDidTap() {
        let viewController = CharacterListViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
