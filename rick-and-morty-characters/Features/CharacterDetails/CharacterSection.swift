//
//  CharacterSection.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 11/10/23.
//

enum Section: Int, CaseIterable {
    case about
    case episodes
    
    var title: String {
        switch self {
        case .about:
            return "Sobre"
        case .episodes:
            return "Episodios"
        }
    }
}
