//
//  BackButton.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 10/10/23.
//

import UIKit

class BackButton: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .Others.color10
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 19
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.tintColor = .Others.color9
        button.setImage(UIImage(named: "back1x")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Properties
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event) {
        backButton.addTarget(target, action: action, for: controlEvents)
    }
}

// MARK: - ViewCodeProtocol Extension

extension BackButton: ViewCode {
    
    func setupHierarchy() {
        addSubview(contentView)
        contentView.addSubview(backButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            contentView.heightAnchor.constraint(equalToConstant: 35),
//            contentView.widthAnchor.constraint(equalToConstant: 35),
            
            backButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
//
//            backButton.topAnchor.constraint(equalTo: topAnchor),
//            backButton.leadingAnchor.constraint(equalTo: leadingAnchor),
//            backButton.trailingAnchor.constraint(equalTo: trailingAnchor),
//            backButton.bottomAnchor.constraint(equalTo: bottomAnchor),

        ])
        
    }
    
    func setupConfigurations() {
        clipsToBounds = false
        backgroundColor = .clear
        backButton.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
 
}
