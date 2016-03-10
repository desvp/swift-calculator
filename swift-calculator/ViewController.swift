//
//  ViewController.swift
//  swift-calculator
//
//  Created by Combo on 02/24/16.
//  Copyright © 2016 Combo. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var collectionView: UICollectionView?
    let items = [
        0: ["AC", "operator"],
        1: ["±", "operator"],
        2: ["%", "operator"],
        3: ["÷", "operator"],
        4: ["7", "digit"],
        5: ["8", "digit"],
        6: ["9", "digit"],
        7: ["×", "operator"],
        8: ["4", "digit"],
        9: ["5", "digit"],
        10: ["6", "digit"],
        11: ["−", "operator"],
        12: ["1", "digit"],
        13: ["2", "digit"],
        14: ["3", "digit"],
        15: ["+", "operator"],
        16: ["0", "digit"],
        17: [".", "digit"],
        18: ["=", "operator"]
    ]
    var cellWidth: CGFloat = 0.0
    var cellHeight: CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        // LaunchImage 延时
        // NSThread.sleepForTimeInterval(1.0)

        initLayout()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initLayout() {
        /*
        iPhone 6 Plus and 6S Plus, frame width: 414.0, cell width: 103.0
        iPhone 6 and 6S,           frame width: 375.0, cell width: 93.5
        iPhone 5 and 5S,           frame width: 320.0, cell width: 80.0
        */
        var adjustment: CGFloat {
            switch(self.view.frame.width) {
            case 414:
                return 2.0
            case 375:
                return 1.0
            default:
                return 0.0
            }
        }

        cellWidth = (self.view.frame.width - adjustment) / 4.0
        let left = adjustment / 2
        let right = adjustment / 2
        cellHeight = ceil((self.view.frame.height * 0.5) / 5.0)
        let top = self.view.frame.height - (cellHeight * 5)

        createInputView(top, left: left, right: right, width: cellWidth, height: cellHeight)
    }

    func createInputView(top: CGFloat, left: CGFloat, right: CGFloat, width: CGFloat, height: CGFloat) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: top, left: left, bottom: 0, right: right)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView!.backgroundColor = UIColor(RGB: 0x333333)
        self.view.addSubview(collectionView!)
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var width: CGFloat = cellWidth

        if self.items[indexPath.item]![0] == "0" {
            width = cellWidth * 2
        }

        return CGSizeMake(width, cellHeight)
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        var cursor = self.items[indexPath.item]

        var nodeColors: (text:UIColor, background:UIColor, selectedBackground:UIColor) {
            switch(cursor?[1]) {
            case "digit"?:
                return (text:UIColor(RGB: 0x000000), background:UIColor(RGB: 0xD4D5D7), selectedBackground:UIColor(RGB: 0xB8B9BC))
            default:
                return (text:UIColor(RGB: 0xFFFFFF), background:UIColor(RGB: 0xF98911), selectedBackground:UIColor(RGB: 0xE07F10))
            }
        }
        cell.backgroundColor = nodeColors.background
        cell.selectedBackgroundView?.backgroundColor = nodeColors.selectedBackground
        cell.labelView?.textColor = nodeColors.text

        cell.labelView?.text = "\(String(cursor![0]))"

        return cell
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cursor = self.items[indexPath.item]
        print("\(cursor![0])", terminator: " ")
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
    }

}
