//
//  OnboardingView.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 25/09/23.
//

import Foundation
import UIKit

protocol OnboardingViewDelegate: AnyObject {
    func onSeeCharactersDidTap()
}

final class OnboardingView: UIView {
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView(image: .logoImg)
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem-vindo!"
        label.textAlignment = .center
        label.font = .customFont(ofSize: 38, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Neste aplicativo você terá acesso há centenas de personagens, imagens e episódios da animação Rick and Morty."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .customFont(ofSize: 18, weight: .regular)
        label.textColor = .Grays.color3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var seeCharactersButton: CustomButton = {
        let button = CustomButton(action: .init(title: "Ver personagens", handler: { [delegate] _ in
            delegate?.onSeeCharactersDidTap()
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView([titleLabel, descriptionLabel, seeCharactersButton],
                    axis: .vertical,
                    distribution: .fill,
                    alignment: .fill,
                    spacing: 22
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.setCustomSpacing(42, after: descriptionLabel)
        return stackView
    }()
    
    // MARK: - Properties
    
    weak var delegate: OnboardingViewDelegate?

    // MARK: - Inits
    
    init(delegate: OnboardingViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

// MARK: - ViewCode

extension OnboardingView: ViewCode {
   
    func setupHierarchy() {
        addSubview(logoImage)
        addSubview(containerStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 42),
            logoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            logoImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            logoImage.heightAnchor.constraint(equalToConstant: 300),
            logoImage.widthAnchor.constraint(equalToConstant: 300),
        
            containerStackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 32),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    func setupConfigurations() {
        backgroundColor = .white
    }
    
}
