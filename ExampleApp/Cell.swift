//
//  Cell.swift
//  ExampleApp
//
//  Created by Emil Wojtaszek on 12/02/2017.
//  Copyright © 2017 AppUnite Sp. z o.o. All rights reserved.
//

import UIKit

class Cell: TextCell {

    lazy var widthLayoutConstraint: NSLayoutConstraint? = {
       return self.titleLabel.widthAnchor.constraint(equalToConstant: 0)
    }()
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
    
        // update 
        if let layoutAttributes = layoutAttributes as? LayoutAttributes {
            if let preferredWidth = layoutAttributes.preferredWidth {
                self.widthLayoutConstraint?.constant = preferredWidth - 2 * padding
                self.widthLayoutConstraint?.isActive = true
            } else {
                self.widthLayoutConstraint?.isActive = false
            }
        }
    }
    
    public override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        return super.preferredLayoutAttributesFitting(layoutAttributes)
//        var frame = layoutAttributes.frame
//        frame.size.width = UIScreen.main.bounds.width
//
//        // perform layout
//        setNeedsLayout()
//        layoutIfNeeded()
//        
//        // get size
//        let targetSize = CGSize(width: UIScreen.main.bounds.width, height: 0.0)
//        let size = contentView.systemLayoutSizeFitting(targetSize,
//                                                       withHorizontalFittingPriority: UILayoutPriorityRequired,
//                                                       verticalFittingPriority: UILayoutPriorityDefaultLow
//        )
//        
//        // apply frame changes
//        frame.size.height = size.height
//        layoutAttributes.frame = frame
//        
//        //
//        return layoutAttributes
    }

    /// MARK: Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    /// MARK: Private
    
    private func setup() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
}
