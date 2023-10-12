//
//  UIColor+Extensions.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 25/09/23.
//

import UIKit

extension UIColor {

    enum Grays {

        static let color1: UIColor = .init(r: 242, g: 242, b: 242)
       
        static let color2: UIColor = .init(r: 196, g: 196, b: 196)

        static let color3: UIColor = .init(r: 116, g: 116, b: 118)

        static let color4: UIColor = .init(r: 51, g: 51, b: 51)
        
        static let color5: UIColor = .init(r: 36, g: 40, b: 47)
    }

    enum Others {
        
        static let color6: UIColor = .init(r: 85, g: 204, b: 68)
        
        static let color7: UIColor = .init(r: 82, g: 110, b: 45)
        
        static let color8: UIColor = .init(r: 214, g: 61, b: 46)
        
        static let color9: UIColor =  .init(r: 235, g: 235, b: 235)
        
        static let color10: UIColor =  .init(r: 0.20, g: 0.20, b: 0.20, a: 0.4)
    }

    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(
            red: r / 255,
            green: g / 255,
            blue: b / 255,
            alpha: a
        )
    }
}
