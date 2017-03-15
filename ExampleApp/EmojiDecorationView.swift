//
//  EmojiDecorationView.swift
//  ExampleApp
//
//  Created by Emil Wojtaszek on 12/03/2017.
//  Copyright © 2017 AppUnite Sp. z o.o. All rights reserved.
//

import UIKit

class EmojiDecorationView: UICollectionReusableView {

    /// Context text label
    let emojiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: UIFontWeightRegular)
        label.textAlignment = .center
        
        return label
    }()
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        /// this method is invoked on each layout invalidation
        /// good place for additional setup
        if layoutAttributes.alpha >= 1.0 {
            emojiLabel.text = "😎"
        } else {
            emojiLabel.text = "🙂"
        }
        
        //
        self.emojiLabel.transform = CGAffineTransform.identity.scaledBy(
            x: layoutAttributes.alpha,
            y: layoutAttributes.alpha
        )
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        // add views
        addSubview(emojiLabel)
        
        // activate constraints
        self.centerXAnchor.constraint(equalTo: emojiLabel.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: emojiLabel.centerYAnchor).isActive = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
