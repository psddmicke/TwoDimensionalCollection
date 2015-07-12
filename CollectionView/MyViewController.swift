//
//  MyViewController.swift
//  CollectionView
//
//  Created by Mikael Svensson on 2015-07-10.
//  Copyright (c) 2015 Romeo Romeo. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var headerContainer: UIView!
    
    var headers:[UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initHeaderArray()
    

        // Do any additional setup after loading the view.
    }
    
    func initHeaderArray() {
        headers = headerContainer.subviews as! [UIView]
        headers.sort({$0.center.y < $1.center.y})
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Collection view data source
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 25
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("dummyCell", forIndexPath: indexPath) as! CollectionViewCell
        //cell.bounds.size = headerRow1.bounds.size
        cell.label.text = String(indexPath.section)
        cell.backgroundColor = headers[indexPath.row].backgroundColor
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
