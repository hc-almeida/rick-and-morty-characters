//
//  CharacterCell.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 26/09/23.
//

import UIKit

final class CharacterCell: UITableViewCell {
    
    // MARK: - User Interface Components
    
    private lazy var cardBase: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .customFont(ofSize: 18, weight: .bold)
//        label.textColor = .white
        return label
    }()
    
    private lazy var speciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .customFont(ofSize: 14, weight: .regular)
//        label.textColor = .white
        return label
    }()
    
    private lazy var locationDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .customFont(ofSize: 14, weight: .bold)
//        label.textColor = .white
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .customFont(ofSize: 14, weight: .regular)
//        label.textColor = .white
        return label
    }()

    private lazy var circle: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        return view
    }()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView([nameLabel, hStackView, locationDescriptionLabel, locationLabel],
                                    axis: .vertical,
                                    distribution: .fill,
                                    alignment: .fill,
                                    spacing: 4
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.setCustomSpacing(16, after: hStackView)
        return stackView
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView([circle, speciesLabel],
                                    axis: .horizontal,
                                    distribution: .fill,
                                    alignment: .fill,
                                    spacing: 6
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: CharacterCell.self)
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func layoutSubviews() {
        circle.layer.cornerRadius = circle.layer.bounds.width / 2
        circle.clipsToBounds = true
    }
    
    func configureCell(data: Character) {
        characterImage.image = UIImage(named: data.image)
        nameLabel.text = data.name
        speciesLabel.text = data.species
        locationDescriptionLabel.text = data.origin
        locationLabel.text = data.location
    }
    
}

extension CharacterCell: ViewCode {
    
    func setupHierarchy() {
        addSubview(cardBase)
        cardBase.addSubview(characterImage)
        cardBase.addSubview(vStackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardBase.topAnchor.constraint(equalTo: topAnchor),
            cardBase.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardBase.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardBase.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            cardBase.heightAnchor.constraint(equalToConstant: 120),
            
            characterImage.topAnchor.constraint(equalTo: topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImage.heightAnchor.constraint(equalToConstant: 120),
            characterImage.widthAnchor.constraint(equalToConstant: 120),
            
            vStackView.topAnchor.constraint(equalTo: cardBase.topAnchor, constant: 4),
            vStackView.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 8),
            vStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            vStackView.bottomAnchor.constraint(equalTo: cardBase.bottomAnchor, constant: -8),
            
            circle.heightAnchor.constraint(equalToConstant: 10),
            circle.widthAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    func setupConfigurations() {
        selectionStyle = .none
        backgroundColor = .clear
        cardBase.layer.cornerRadius = 12
        cardBase.layer.borderColor = UIColor.Others.color7.cgColor
        cardBase.layer.borderWidth = 1
        
        cardBase.layer.shadowColor = UIColor.black.cgColor
        cardBase.layer.shadowOffset = CGSize(width: 0, height: 4)
        cardBase.layer.shadowRadius = 2
        cardBase.layer.shadowOpacity = 0.2
        cardBase.layer.shouldRasterize = true
        cardBase.layer.rasterizationScale = UIScreen.main.scale
    }
    
}
