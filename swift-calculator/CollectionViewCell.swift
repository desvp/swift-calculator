//
//  CollectionViewCell.swift
//  swift-calculator
//
//  Created by Combo on 02/24/16.
//  Copyright © 2016 Combo. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    var labelView: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        let textFrame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        labelView = UILabel(frame: textFrame)
        labelView.font = UIFont.systemFontOfSize(CGFloat(32), weight: UIFontWeightLight)
        labelView.textAlignment = .Center
        labelView.layer.borderColor = UIColor(RGB: 0x333333).CGColor
        labelView.layer.borderWidth = 0.5

//        labelView.layer.shadowColor = UIColor.darkGrayColor().CGColor
//        labelView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        labelView.layer.shadowOpacity = 0.8
//        labelView.layer.shadowRadius = 2

        contentView.addSubview(labelView)
    }
}
