//
//  CharacterAbout.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 11/10/23.
//

import UIKit

protocol CharacterAboutViewModelProtocol {
    var title: String { get }
    var about: [String] { get }
}

struct CharacterAbout: CharacterAboutViewModelProtocol {
    var title: String
    var about: [String]
    
    init(title: String, about: [String]) {
        self.title = title
        self.about = about
    }
    
}

//var CharacterAboutData = [
//
//    CharacterAbout(
//        title: "About",
//        about: [About(species: "Human", origin: "Earth", location: "Cidadel of Ricks")]
//    ),
//
//    CharacterAbout(
//        title: "About",
//        about: [About(species: "Human", origin: "Earth", location: "Cidadel of Ricks")]
//    ),
//
//    CharacterAbout(
//        title: "About",
//        about: [About(species: "Human", origin: "Earth", location: "Cidadel of Ricks")]
//    ),
//
//    CharacterAbout(
//        title: "About",
//        about: [About(species: "Human", origin: "Earth", location: "Cidadel of Ricks")]
//    )
//
//]
