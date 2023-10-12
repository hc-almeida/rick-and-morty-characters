//
//  AboutCell.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 11/10/23.
//
import UIKit

final class AboutCell: UITableViewCell {
    
    private lazy var icon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .Others.color7
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font =  .customFont(ofSize: 18, weight: .bold)
        label.textColor = .Grays.color3
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .customFont(ofSize: 18, weight: .regular)
        label.textColor = .Grays.color3
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private lazy var textsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var rootStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [icon, textsStackView])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 12
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var divider: UIView = {
        let view = UIView()
        view.alpha = 0.15
        view.backgroundColor = .Grays.color2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    static let identifier = String(describing: AboutCell.self)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup(data: CharacterAbout) {
        icon.image =  UIImage(named: data.icon)
        titleLabel.text = data.title
        descriptionLabel.text = data.descrition
        divider.isHidden = data.hideSeparatorView
    }
    
}

extension AboutCell: ViewCode {
    
    func setupHierarchy() {
        contentView.addSubview(rootStackView)
        contentView.addSubview(divider)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            rootStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            rootStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            rootStackView.bottomAnchor.constraint(equalTo: divider.topAnchor),
            rootStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            divider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            divider.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            divider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1),
            
            icon.heightAnchor.constraint(equalToConstant: 24),
            icon.widthAnchor.constraint(equalToConstant: 24)
        ])
  
    }
    
    func setupConfigurations() {
        backgroundColor = .white
        selectionStyle = .none
    }
}

