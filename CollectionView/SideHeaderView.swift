//
//  SideHeaderView.swift
//  CollectionView
//
//  Created by Mikael Svensson on 2015-07-11.
//  Copyright (c) 2015 Romeo Romeo. All rights reserved.
//

import UIKit

@IBDesignable
class SideHeaderView: UIView {
    @IBInspectable var count: Int = 6
    @IBInspectable var margin: CGFloat = 8
    var labels: [UILabel] = []

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        var origin = CGPointZero
        let size = CGSize(width: bounds.width, height: bounds.width)
        
        while subviews.count < count ?? 0 {
            let cell = SideHeaderViewCell(frame: CGRect(origin: origin, size: size))
            
            cell.autoresizingMask = .FlexibleWidth | .FlexibleHeight
            addSubview(cell)
            cell.index = subviews.count
            let descriptionLabel = UILabel()
            descriptionLabel.text = "This is a description label."
            descriptionLabel.sizeToFit()
            descriptionLabel.frame.origin.x = size.width
            descriptionLabel.frame.origin.y = origin.y - (descriptionLabel.bounds.height / 2.0)
            origin.y += size.height + margin
            labels.append(descriptionLabel)
        }
        for label in labels {
            addSubview(label)
        }
    }
    
    override func prepareForInterfaceBuilder() {
        //
        setup()
    }


}

@IBDesignable
class SideHeaderViewCell: UIView {
    @IBInspectable var index: Int = 0 {
        didSet {
            updateLabel()
        }
    }
    var label: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        label = UILabel(frame: bounds)
        label.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        label.textAlignment = .Center
        addSubview(label)
    }
    
    func updateLabel() {
        label.font = UIFont(name: "Helvetica-Bold", size: bounds.height * 0.62)
        label.text = letterForIndex(index - 1)
    }
    
    override func prepareForInterfaceBuilder() {
        updateLabel()
    }
    
    private func letterForIndex(index: Int) -> String {
        let collation = UILocalizedIndexedCollation.currentCollation() as! UILocalizedIndexedCollation
        if index < collation.sectionIndexTitles.count {
            return collation.sectionIndexTitles[index] as! String
        }
        return String(index)
    }
}
