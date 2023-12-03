//
//  CustomButton.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 25/09/23.
//

import UIKit

final class CustomButton: UIButton {

    // MARK: - Inits
    
    init(action: UIAction) {
        super.init(frame: .zero)

        var config = UIButton.Configuration.plain()
        config.baseBackgroundColor = .clear
        config.buttonSize = .large
        config.cornerStyle = .large
        config.baseForegroundColor = .Others.color7
        config.background.cornerRadius = 12
        config.background.strokeWidth = 1
        config.background.strokeColor = .Others.color7
        
        var container = AttributeContainer()
        container.font = .customFont(ofSize: 19, weight: .bold)
        container.foregroundColor = .Others.color7
        config.attributedTitle = AttributedString(action.title, attributes: container)

        configuration = config

        addAction(action, for: .touchUpInside)

        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 43).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
