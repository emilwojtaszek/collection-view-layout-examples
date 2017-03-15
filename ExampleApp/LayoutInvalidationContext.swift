//
//  InvalidationContext.swift
//  ExampleApp
//
//  Created by Emil Wojtaszek on 12/02/2017.
//  Copyright © 2017 AppUnite Sp. z o.o. All rights reserved.
//

import UIKit

class LayoutInvalidationContext: UICollectionViewLayoutInvalidationContext {
    /// indicate that scroll origin did change and footer view origin shoudl change
    var invalidateFooter = false

    /// collect index path of cell which size did change because of auto-layout recalculation
    var invalidatedSizesForIndexPaths: [IndexPath: CGSize] = [:]
    func invalidateSize(newSize: CGSize, oldSize: CGSize, forIndexPath indexPath: IndexPath) {
        self.invalidatedSizesForIndexPaths[indexPath] = newSize
        
        //
        let delta = CGSize(width: newSize.width - oldSize.width, height: newSize.height - oldSize.height)
        self.contentSizeAdjustment = CGSize(
            width: self.contentSizeAdjustment.width + delta.width,
            height: self.contentSizeAdjustment.height + delta.height
        )
    }
}
