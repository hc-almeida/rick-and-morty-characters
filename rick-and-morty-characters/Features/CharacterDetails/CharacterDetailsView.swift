//
//  CharacterDetailsView.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 10/10/23.
//

import Foundation
import UIKit

protocol CharacterDetailsViewDelegate: AnyObject {
    func didTapAtBackButton()
}

final class CharacterDetailsView: UIView {
    
    // MARK: - UI
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var characterImage: UIImageView = {
        let image = UIImageView(image: .test)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var backButton: BackButton = {
        let button = BackButton()
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var characterTitle: UILabel = {
        let label = UILabel()
        label.font = .customFont(ofSize: 34, weight: .bold)
        label.text = "Antenna Morty"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var cicleView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 1
        view.clipsToBounds = false
        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(ofSize: 18)
        label.textColor = .Others.color6
        label.text = "Humano"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cicleView, statusLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [characterTitle, hStackView])
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = false
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var aboutView: CharacterInfoView = {
        let view = CharacterInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var epView: CharacterInfoView = {
        let view = CharacterInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Properties
   
    weak var delegate: CharacterDetailsViewDelegate?
    private var characterAbout: [Character] = []
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    @objc private func didTap() {
        delegate?.didTapAtBackButton()
    }
    
    private func setup() {
        aboutView.viewModel = CharacterAbout(title: "about", about: ["teste1", "teste2", "teste3"])
        epView.viewModel = CharacterAbout(title: "Ep", about: ["teste4", "teste5", "teste6"])
    }

}

// MARK: - ViewCode

extension CharacterDetailsView: ViewCode {
   
    func setupHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(characterImage)
        contentView.addSubview(backButton)
        contentView.addSubview(container)
        container.addSubview(vStackView)
        container.addSubview(aboutView)
        container.addSubview(epView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
            
            characterImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            characterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            characterImage.widthAnchor.constraint(equalTo: characterImage.heightAnchor),

            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 38),
            backButton.heightAnchor.constraint(equalToConstant: 38),
        
            container.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: -32),
            container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            container.heightAnchor.constraint(equalToConstant: 400),

            vStackView.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 8),
            vStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            vStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            aboutView.topAnchor.constraint(equalTo: vStackView.bottomAnchor, constant: 32),
            aboutView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            aboutView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            epView.topAnchor.constraint(equalTo: aboutView.bottomAnchor, constant: 32),
            epView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            epView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            epView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -24),
            
            cicleView.heightAnchor.constraint(equalToConstant: 12),
            cicleView.widthAnchor.constraint(equalToConstant: 12)
        ])
    }
    
    func setupConfigurations() {
        backgroundColor = .white
    }

}
