//
//  CharacterDetailsView.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 10/10/23.
//

import Foundation
import UIKit

final class CharacterDetailsView: UIView {
    
    private lazy var characterImage: UIImageView = {
        let image = UIImageView(image: .test)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var backButton: BackButton = {
        let button = BackButton()
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
    
    private lazy var stackView: UIStackView = {
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
        view.clipsToBounds = false
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.sectionFooterHeight = .zero
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private var characterAbout: [CharacterAbout] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CharacterDetailsView: ViewCode {
   
    func setupHierarchy() {
        addSubview(characterImage)
        addSubview(backButton)
        addSubview(container)
        container.addSubview(vStackView)
        container.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            characterImage.widthAnchor.constraint(equalTo: characterImage.heightAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 38),
            backButton.heightAnchor.constraint(equalToConstant: 38),
        
            container.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: -32),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            vStackView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            vStackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 16),
            vStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            
            cicleView.heightAnchor.constraint(equalToConstant: 12),
            cicleView.widthAnchor.constraint(equalToConstant: 12),
            
            tableView.topAnchor.constraint(equalTo: vStackView.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }
    
    func setupConfigurations() {
        backgroundColor = .yellow
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AboutCell.self, forCellReuseIdentifier: AboutCell.identifier)
    }

}

// MARK: - UITableViewDelegate

extension CharacterDetailsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - UITableViewDataSource

extension CharacterDetailsView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        Section.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
            case .about:
                return CharacterAboutData.count
            case .episodes:
                return CharacterAboutData.count
            case .none:
                return 0
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section) {
        case .about:
            return infoCell(for: indexPath)
            
        case .episodes:
            return infoCell(for: indexPath)
            
        case .none:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let section = Section(rawValue: section) else { return nil }
        
        let header = UITextView()
        header.isSelectable = false
        header.backgroundColor = .clear
        header.textColor = .Grays.color5
        header.text = section.title
        header.font = .customFont(ofSize: 20, weight: .bold)
        header.textContainerInset = UIEdgeInsets(top: 24, left: 12, bottom: 12, right: 12)
        return header
    }
}

extension CharacterDetailsView {
    
    func infoCell(for indexPath: IndexPath) -> UITableViewCell {
        let identifier = AboutCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: identifier, for: indexPath) as? AboutCell
        else { return UITableViewCell() }
    
    
        cell.setup(data: CharacterAboutData[indexPath.row])
        return cell
    }
    
}
