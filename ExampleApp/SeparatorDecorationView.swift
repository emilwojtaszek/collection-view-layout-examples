//
//  SeparatorDecorationView.swift
//  ExampleApp
//
//  Created by Emil Wojtaszek on 14/03/2017.
//  Copyright © 2017 AppUnite Sp. z o.o. All rights reserved.
//

import UIKit

class SeparatorDecorationView: UICollectionReusableView {
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        // update background color of separator
        if let layoutAttributes = layoutAttributes as? LayoutAttributes {
            self.backgroundColor = layoutAttributes.backgroundColor ?? .white
        }
    }
}
