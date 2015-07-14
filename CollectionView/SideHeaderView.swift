//
//  SideHeaderView.swift
//  CollectionView
//
//  Created by Mikael Svensson on 2015-07-11.
//  Copyright (c) 2015 Romeo Romeo. All rights reserved.
//

import UIKit
/**
    A collection of header cells.
    Ment to be used when there's a need to match a multi-column table view or collection view with a static header.
*/
@IBDesignable
class SideHeaderView: UIView {
    @IBInspectable var count: Int = 6
    @IBInspectable var margin: CGFloat = 8 // y-axis cell margin
    var cells: [SideHeaderViewCell] = []
    var labels: [UILabel] = []

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    /** Setup and add the member subviews. */
    func setup() {
        var origin = CGPointZero
        let size = CGSize(width: bounds.width, height: bounds.width)
        
        while subviews.count < count ?? 0 {
            let cell = SideHeaderViewCell(frame: CGRect(origin: origin, size: size))
            cell.autoresizingMask = .FlexibleWidth | .FlexibleHeight
            cell.backgroundColor = UIColor.forIndex(subviews.count)
            addSubview(cell)
            cells.append(cell)
            cell.index = subviews.count
            let descriptionLabel = UILabel()
            descriptionLabel.text = "This is a description label."
            descriptionLabel.sizeToFit()
            labels.append(descriptionLabel)
        }
        for label in labels {
            addSubview(label)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var origin = CGPointZero // starting origin
        let size = cellSize // store this so we don't need to calculate each iteration.
        
        //iterate the cells
        for i in 0...cells.count - 1 {
            let cell = cells[i]
            cell.frame = CGRect(origin: origin, size: size)
            cell.layer.cornerRadius = size.width / 2.0
            
            //assuming there's an equal amount of labels.
            let label = labels[i]
            label.frame.origin.x = size.width
            label.frame.origin.y = origin.y - label.bounds.midY
            
            //next row.
            origin.y += cellSize.height + margin
            
        }
    }
    
    /** The size of the cell. */
    var cellSize: CGSize {
        let totalMargins = CGFloat(cells.count - 1) * margin
        let side = (bounds.height - totalMargins) / CGFloat(cells.count)
        return CGSize(width: side, height: side)
    }

}
/**
    A single cell for the side header view.
*/
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
    
    /** setup and add subviews */
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
    
    /** Debug method.
        This returns capitalized letters for indexes starting with A = 0. */
    private func letterForIndex(index: Int) -> String {
        let collation = UILocalizedIndexedCollation.currentCollation() as! UILocalizedIndexedCollation
        if index < collation.sectionIndexTitles.count {
            return collation.sectionIndexTitles[index] as! String
        }
        return String(index)
    }
}

private extension UIColor {
    /** Returns a color for an integer. */
    static func forIndex(index: Int) -> UIColor {
        switch index {
        case 0: return UIColor.yellowColor()
        case 1: return UIColor.greenColor()
        case 2: return UIColor.magentaColor()
        case 3: return UIColor.redColor()
        case 4: return UIColor.purpleColor()
        case 5: return UIColor.brownColor()
        default: return forIndex(index % 6)
        }
    }
}
