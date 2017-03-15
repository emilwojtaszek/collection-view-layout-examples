//
//  LayoutAttributes.swift
//  ExampleApp
//
//  Created by Emil Wojtaszek on 12/02/2017.
//  Copyright © 2017 AppUnite Sp. z o.o. All rights reserved.
//

import UIKit

final class LayoutAttributes: UICollectionViewLayoutAttributes {
    // separator background color
    var backgroundColor: UIColor?

    // prefered with of cell (used for autolayout, activated if not nil)
    var preferredWidth: CGFloat?
    
    // fill documentation requirements
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! LayoutAttributes
        copy.backgroundColor = backgroundColor
        copy.preferredWidth = preferredWidth
        return copy
    }

    // fill documentation requirements
    override func isEqual(_ object: Any?) -> Bool {
        if let attributes = object as? LayoutAttributes {
            if attributes.backgroundColor == backgroundColor &&
                attributes.preferredWidth == preferredWidth {
                return super.isEqual(object)
            }
        }
        return false
    }
}
