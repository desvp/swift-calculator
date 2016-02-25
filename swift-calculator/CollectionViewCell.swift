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

    var textLabel: UILabel!
    var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.contentMode = UIViewContentMode.ScaleToFill
        contentView.addSubview(imageView)

        let textFrame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        textLabel = UILabel(frame: textFrame)
        textLabel.font = UIFont.systemFontOfSize(CGFloat(60))
        textLabel.textAlignment = .Center
        contentView.addSubview(textLabel)
    }
}
