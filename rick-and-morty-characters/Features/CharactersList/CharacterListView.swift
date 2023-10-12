//
//  CharacterList.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 28/09/23.
//

import UIKit

protocol CharacterListViewDelegate: AnyObject {
    func selectCharacter(at index: Int)
}

class CharacterListView: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    weak var delegate: CharacterListViewDelegate?
    
    // MARK: - Inits
    
    init(_ delegate: CharacterListViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        tableView.reloadData()
    }

}

// MARK: - ViewCode

extension CharacterListView: ViewCode {
    
    func setupHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
        ])
    }
    
    func setupConfigurations() {
        backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.identifier)
    }

}

// MARK: - UITableViewDelegate Extension

extension CharacterListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = CharacterCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: identifier, for: indexPath) as? CharacterCell
        else { return UITableViewCell() }
        
        cell.configureCell(data: DataChacter[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectCharacter(at: indexPath.item)
    }
}

// MARK: - UITableViewDataSource Extension

extension CharacterListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataChacter.count
    }
    
}

var DataChacter = [

    Character(
        image: "image",
        name: "Quantum Rick",
        species: "Unknow",
        origin: "Last known location:",
        location: "Rick's Memories"
    ),
    Character(
        image: "image",
        name: "Quantum Rick",
        species: "Unknow",
        origin: "Last known location:",
        location: "Rick's Memories"
    ),
    Character(
        image: "image",
        name: "Quantum Rick",
        species: "Unknow",
        origin: "Last known location:",
        location: "Rick's Memories"
    ),
    Character(
        image: "image",
        name: "Quantum Rick",
        species: "Unknow",
        origin: "Last known location:",
        location: "Rick's Memories"
    ),
    Character(
        image: "image",
        name: "Quantum Rick",
        species: "Unknow",
        origin: "Last known location:",
        location: "Rick's Memories"
    )


]
