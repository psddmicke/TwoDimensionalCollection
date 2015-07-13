//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Mikael Svensson on 2015-07-10.
//  Copyright (c) 2015 Romeo Romeo. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    var separator: CALayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if separator == nil {
            separator = CALayer()
            separator?.backgroundColor = UIColor.purpleColor().CGColor
            layer.addSublayer(separator)
        }
        
        separator?.frame = CGRect(origin: CGPoint(x: bounds.maxX - 1, y: 10), size: CGSize(width: 1, height: bounds.height - 20))
        
    }
    
    
}
