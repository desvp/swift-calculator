//
//  ExtensionUILabel.swift
//  swift-calculator
//
//  Created by Combo on 03/10/16.
//  Copyright © 2016 Combo. All rights reserved.
//

import UIKit


class UILabelWithInset: UILabel {

    override func drawTextInRect(rect: CGRect) {
        let insetTop = CGFloat(0)
        let insetBottom = CGFloat(0)
        let insetLeft = CGFloat(12.0)
        let insetRight = CGFloat(12.0)
        let insets: UIEdgeInsets = UIEdgeInsets(top: insetTop, left: insetLeft, bottom: insetBottom, right: insetRight)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }

}