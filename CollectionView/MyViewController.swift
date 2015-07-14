//
//  MyViewController.swift
//  CollectionView
//
//  Created by Mikael Svensson on 2015-07-10.
//  Copyright (c) 2015 Romeo Romeo. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var sideHeader: SideHeaderView!

    // MARK: - Collection view data source
    
    /**
        Using rows as sections and sections as rows.
    */
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 25
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sideHeader.cells.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        cell.label.text = String(indexPath.section)

        return cell
    }
    
    // MARK: - Flow layout delegate
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return sideHeader.cellSize
    }
    



}
