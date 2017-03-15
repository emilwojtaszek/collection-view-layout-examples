//
//  TextCell.swift
//  ExampleApp
//
//  Created by Emil Wojtaszek on 12/03/2017.
//  Copyright © 2017 AppUnite Sp. z o.o. All rights reserved.
//

import UIKit

class TextCell: UICollectionViewCell {
    static let reuseIdentifier: String = "TextCell"
    
    /// Context text label
    /// Setting numbers of lines to zero
    /// requerd by auto-sizing cells example
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    /// MARK: Initialization
    
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
        // setup content view
        contentView.backgroundColor = .white

        // add subview
        contentView.addSubview(titleLabel)

        // create list of constraints
        let constraints = [
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-[label]-|",
                options: [],
                metrics: nil,
                views: ["label": titleLabel]),
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-(padding)-[label]-(padding)-|",
                options: [],
                metrics: ["padding": padding],
                views: ["label": titleLabel])
        ]
        
        // active all costraints
        contentView.addConstraints(constraints.flatMap { $0 })
    }

    /// applied horizontal text label padding (from left and right)
    let padding: CGFloat = 8.0
}
