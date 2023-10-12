//
//  UIFont+Extensions.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 25/09/23.
//

import UIKit

extension UIFont {

    enum CustomWeight {
        case regular
        case bold
        case light

        func getName() -> String {
            switch self {
            case .regular:
                return "Regular"
            case .bold:
                return "Bold"
            case .light:
                return "Light"
            }
        }
    }

    class func customFont(ofSize size: CGFloat, weight: CustomWeight = .regular) -> UIFont {
        guard let font = UIFont(name: "SFProDisplay-\(weight.getName())", size: size) else {
            return .systemFont(ofSize: size)
        }
        return font
    }
}

