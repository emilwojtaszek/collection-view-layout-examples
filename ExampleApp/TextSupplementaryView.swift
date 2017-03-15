//
//  TextSupplementaryView.swift
//  ExampleApp
//
//  Created by Emil Wojtaszek on 12/03/2017.
//  Copyright © 2017 AppUnite Sp. z o.o. All rights reserved.
//

import UIKit

class TextSupplementaryView: UICollectionReusableView {
    static let reuseIdentifier: String = "TextSupplementaryView"
    
    /// Context text label
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
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
        // setup view
        backgroundColor = .white
        
        // add subviews
        addSubview(titleLabel)
        
        //
        let views: [String: AnyObject] = ["label": titleLabel]
        
        // create list of constraints
        let constraints = [
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-[label]-|", options: [], metrics: nil, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[label]-|", options: [], metrics: nil, views: views)
        ]
        
        // active all costraints
        addConstraints(constraints.flatMap { $0 })
    }
}
