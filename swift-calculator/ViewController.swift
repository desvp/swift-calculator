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

        createNumberView(marginTop, width: cellWidth, height: cellHeight)
        createOperatorView(marginTop, width: cellWidth, height: cellHeight)

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createNumberView(top: CGFloat, width: CGFloat, height: CGFloat) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: top, left: 0, bottom: 0, right: width+1.0)
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
        return 15
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

    func createOperatorView(top: CGFloat, width: CGFloat, height: CGFloat) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: top, left: 0, bottom: 0, right: width+1.0)
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = 1.0
        layout.minimumLineSpacing = 1.0
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView!.backgroundColor = UIColor.blueColor()
        self.view.addSubview(collectionView!)
    }

    /*
    func create_buttons() {

        let _width = self.view.frame.width
        let _height = self.view.frame.height
        let _margin_top = CGFloat(20.0) + _height * 0.325

        let width = _width / 4
        let height = _height * 0.625 / 5

        var x:CGFloat
        var y:CGFloat
        var z:CGFloat

        x = CGFloat(0.0)
        y = _margin_top

        add_button(x, y:y, width:width, height:height, title:"1")

        z = x + width + 2
        add_button(z, y:y, width:width, height:height, title:"2")

        z = x + (width + 2) * 2
        add_button(z, y:y, width:width, height:height, title:"3")

        z = x + (width + 2) * 3
        add_button(z, y:y, width:width, height:height, title:"4")

        y = _margin_top + height + 2

        add_button(x, y:y, width:width, height:height, title:"5")

        z = x + width + 2
        add_button(z, y:y, width:width, height:height, title:"6")

        z = x + (width + 2) * 2
        add_button(z, y:y, width:width, height:height, title:"7")

        z = x + (width + 2) * 3
        add_button(z, y:y, width:width, height:height, title:"8")

    }

    func add_button(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, title: String) {
        let button = UIButton(type: UIButtonType.System)
        button.frame = CGRectMake(x, y, width, height)
        button.backgroundColor = UIColor.blackColor()
        button.setTitle(title, forState: UIControlState.Normal)
        // button.addTarget(self, action: "buttonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    */

}

