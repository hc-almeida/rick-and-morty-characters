//
//  CharacterInfoView.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 02/12/23.
//

import Foundation
import UIKit

final class CharacterInfoView: UIView {
    
    // MARK: - UI
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
        
    var viewModel: CharacterAboutViewModelProtocol? {
        didSet {
            update()
        }
    }
    
    // MARK: - Private Methods
    
    private func update() {
        if let model = viewModel {
            titleLabel.text = model.title
            configureView(with: model.about)
        }
    }
    
    private func configureView(with item: [String]) {
        for (index, about) in item.enumerated() {
            let isLast = (item.count - 1) == index
            let label = UILabel()
            label.text = about
            label.textAlignment = .left
            label.font = .customFont(ofSize: 18, weight: .light)
            
            let divider = UIView()
            divider.alpha = 0.60
            divider.backgroundColor = .Grays.color2
            divider.isHidden = isLast ? true : false
            divider.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
     
            hStackView.addArrangedSubViews([label, divider])
            hStackView.layoutIfNeeded()
        }
    }
}

// MARK: - ViewCode

extension CharacterInfoView: ViewCode {
   
    func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(hStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            hStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            hStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            hStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
