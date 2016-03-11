//
//  ExtensionUILabel.swift
//  swift-calculator
//
//  Created by Combo on 03/10/16.
//  Copyright © 2016 Combo. All rights reserved.
//

import UIKit


class LabelWithInset: UILabel {

    var insets: UIEdgeInsets = UIEdgeInsets(top: CGFloat(0), left: CGFloat(12), bottom: CGFloat(0), right: CGFloat(12))

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

    func resetInsets(insets: UIEdgeInsets) {
        self.insets = insets
    }

    func resetInsets(top top: Int, left: Int, bottom: Int, right: Int) {
        self.insets = UIEdgeInsets(top: CGFloat(top), left: CGFloat(left), bottom: CGFloat(bottom), right: CGFloat(right))
    }

    override func drawTextInRect(rect: CGRect) {
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }

}