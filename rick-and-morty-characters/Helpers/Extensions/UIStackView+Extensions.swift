//
//  UIStackView+Extensions.swift
//  rick-and-morty-characters
//
//  Created by Hellen Caroline  on 25/09/23.
//

import UIKit

extension UIStackView {

    convenience init(
        _ arrangedSubviews: [UIView] = [],
        axis: NSLayoutConstraint.Axis = .vertical,
        distribution: Distribution = .fill,
        alignment: Alignment = .fill,
        spacing: CGFloat = 8
    ) {
        self.init()
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
        self.axis = axis
        arrangedSubviews.forEach { v in
            self.addArrangedSubview(v)
        }
    }
    
    func addArrangedSubViews(_ views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
