//
//  CollectionViewController.swift
//  CollectionView
//
//  Created by Mikael Svensson on 2015-07-10.
//  Copyright (c) 2015 Romeo Romeo. All rights reserved.
//

import UIKit

let reuseIdentifier = "MyCell"

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        println("width: \(view.bounds.width)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 25
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return 4
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        /*let identifier = indexPath.row == 0 ? "headerCell" : "cell"
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! CollectionViewCell
        cell.label.adjustsFontSizeToFitWidth = true
        cell.label.minimumScaleFactor = 0.2
        cell.label.text = "s: \(indexPath.section) - r: \(indexPath.row)"
        
        cell.backgroundColor = colorForIndex(indexPath.row)
        //cell.layer.cornerRadius = 5*/
    
        // Configure the cell
    
        //return indexPath.section == 0 ? headerCellInCollectionView(collectionView, forIndexPath: indexPath) : contentCellInCollectionView(collectionView, forIndexPath: indexPath)
        return contentCellInCollectionView(collectionView, forIndexPath: indexPath)
    }

    // MARK: UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "header", forIndexPath: indexPath) as! UICollectionReusableView
        if indexPath.section == 0 {
            return view
        }
        
        view.frame = CGRectZero
        return view
        
    }

    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }


    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }



    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    
    // MARK: - Configured cells
    func headerCellInCollectionView(collectionView: UICollectionView, forIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("headerCell", forIndexPath: indexPath) as! CollectionViewHeaderCell
        cell.label.text = "\(indexPath.row)"
        return cell
    }
    
    func contentCellInCollectionView(collectionView: UICollectionView, forIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        cell.label.text = "\(indexPath.section)"
        cell.label.textColor = colorForIndex(indexPath.section)
        return cell
    }

    
    // MARK: - Styling
    func colorForIndex(index: Int) -> UIColor {
        switch index {
        case 0: return UIColor.orangeColor()
        case 1: return UIColor.blueColor()
        case 2: return UIColor.brownColor()
        case 3: return UIColor.cyanColor()
        case 4: return UIColor.grayColor()
        case 5: return UIColor.greenColor()
        case 6: return UIColor.yellowColor()
        default: return colorForIndex(index % 7)
        }
    }
    

}
