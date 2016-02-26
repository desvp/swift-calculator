//
//  ViewController.swift
//  swift-calculator
//
//  Created by Combo on 02/24/16.
//  Copyright © 2016 Combo. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 延长 1 秒
        NSThread.sleepForTimeInterval(1.0)

        // create_buttons()

        let viewWidth = self.view.frame.width
        let viewHeight = self.view.frame.height
        let cellWidth = (viewWidth - 3.0) / 4
        let cellHeight = (viewHeight * 0.625 - 4.0) / 5

        // let _margin_top = CGFloat(20.0) + _view_height * 0.325
        let marginTop = viewHeight - (cellHeight * 5 + 4)

        createInputView(marginTop, width: cellWidth, height: cellHeight)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createInputView(top: CGFloat, width: CGFloat, height: CGFloat) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = 1.0
        layout.minimumLineSpacing = 1.0
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView!.backgroundColor = UIColor.grayColor()
        self.view.addSubview(collectionView!)
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.blueColor()
        // print(indexPath)
        cell.textLabel?.text = "\(indexPath.row+1)"
        cell.imageView?.image = UIImage(named: "background-number")
        //cell.imageView?.image = UIImage(named: "background-operator")

        return cell
    }

}

