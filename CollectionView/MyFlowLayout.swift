//
//  MyFlowLayout.swift
//  CollectionView
//
//  Created by Mikael Svensson on 2015-07-10.
//  Copyright (c) 2015 Romeo Romeo. All rights reserved.
//

import UIKit

class MyFlowLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        itemSize = CGSize(width: 50, height: 50)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
