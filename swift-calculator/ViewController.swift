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
        11: ["-", "operator"],
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
        var adjustment = CGFloat(0.0)
        /*
        iPhone 6 Plus and 6S Plus, width is 414.0, cell width: 103.0
        iPhone 6 and 6S, width is 375.0, cell width: 93.5
        iPhone 5 and 5S, width is 320.0, cell width: 80.0
        */
        if self.view.frame.width == 414 {
            adjustment = 2.0
        } else if self.view.frame.width == 375 {
            adjustment = 1.0
        } else {
            adjustment = 0.0
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

        cell.selectedBackgroundView = UIView()

        cell.labelView?.text = "\(String(cursor![0]))"
        if cursor?[1] == "digit" {
            cell.backgroundColor = UIColor(RGB: 0xD4D5D7)
            cell.labelView?.textColor = UIColor(RGB: 0x000000)
            cell.selectedBackgroundView?.backgroundColor = UIColor(RGB: 0xB8B9BC)
            // cell.selectedBackgroundView?.backgroundColor = UIColor(RGB: 0xB2B3B5)
        } else {
            cell.backgroundColor = UIColor(RGB: 0xF98911)
            cell.labelView?.textColor = UIColor(RGB: 0xFFFFFF)
            cell.selectedBackgroundView?.backgroundColor = UIColor(RGB: 0xE07F10)
        }

        return cell
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cursor = self.items[indexPath.item]
        print("\(cursor![0])", terminator: " ")
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
    }

}
