//
//  ViewCode.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 25/09/23.
//

import Foundation

public protocol ViewCode {

    func setupHierarchy()
    func setupConstraints()
    func setupConfigurations()
}

public extension ViewCode {

    func setupView() {
        setupHierarchy()
        setupConstraints()
        setupConfigurations()
    }

    func setupConfigurations() {}
}

