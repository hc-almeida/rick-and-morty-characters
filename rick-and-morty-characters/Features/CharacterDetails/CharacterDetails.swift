//
//  CharacterDetails.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 02/12/23.
//

import Foundation

struct CharacterDetail  {
    let image: String
    let name: String
    let status: String
    let about: About
    let episode: [Episode]
}

struct About {
    let species: String
    let origin: String
    let location: String
}

struct Episode {
    let name: String
    let episode: String
}
