//
//  AnimationLayout.swift
//  ExampleApp
//
//  Created by Emil Wojtaszek on 14/03/2017.
//  Copyright © 2017 AppUnite Sp. z o.o. All rights reserved.
//

import UIKit

class AnimationLayout: UICollectionViewLayout {
    /// struct of layout constants
    private struct Constants {
        struct Separator {
            static let kind = "separator"
        }
        
        struct Cell {
            static let normalHeight: CGFloat = 50.0
            static let expandedHeight: CGFloat = 150.0
        }
    }

    /// cell attributes
    private var currentAttributes: [LayoutAttributes] = []
    private var previousAttributes: [LayoutAttributes] = []
    
    /// separator attributes
    private var currentSeparatorAttributes: [LayoutAttributes] = []
    private var previousSeparatorAttributes: [LayoutAttributes] = []
    
    /// separator height and color
    var separatorHeight: CGFloat = 8.0
    var separatorColor: UIColor = UIColor.red
    
    // keep info about selected cell
    var expandedIndexPath: IndexPath?
    
    required public override init() {
        super.init()
        self.registerDecorationView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.registerDecorationView()
    }
    
    override class var layoutAttributesClass: AnyClass {
        /// separator color can be changes, info about 
        /// color is keept in custom layout attributes
        return LayoutAttributes.self
    }
    
    /// MARK: - Preparation
    
    override func prepare() {
        super.prepare()

        // for simplicity supports only one section with multiple cells
        guard let collectionView = collectionView else { return }
        assert(collectionView.numberOfSections == 1, "This layout supports only one section")

        //
        previousAttributes = currentAttributes
        currentAttributes = []

        //
        previousSeparatorAttributes = currentSeparatorAttributes
        currentSeparatorAttributes = []
        
        //
        var origin: CGFloat = 0
        let width = collectionView.bounds.size.width
        let itemCounts = collectionView.numberOfItems(inSection: 0)

        //
        for itemIndex in 0..<itemCounts {
            // create cell attribute
            let indexPath = IndexPath(item: itemIndex, section: 0)
            let itemAttributes = LayoutAttributes(forCellWith: indexPath)
            
            // calculate item size, take a look that at this stage we analyze `expandedIndexPath`
            let itemSize = CGSize(
                width: width,
                height: expandedIndexPath == indexPath ? Constants.Cell.expandedHeight : Constants.Cell.normalHeight
            )
            
            // set frame and collect attributes
            itemAttributes.frame = CGRect(origin: CGPoint(x: 0.0, y: origin), size: itemSize)
            currentAttributes.append(itemAttributes)

            // move cursor
            origin += itemSize.height

            // do not add separator below last cell
            if itemCounts - 1 > itemIndex {
                // create new separator attributes
                let separatorAttributes = LayoutAttributes(
                    forDecorationViewOfKind: Constants.Separator.kind,
                    with: indexPath
                )
                
                // calculate size
                separatorAttributes.frame = CGRect(
                    origin: CGPoint(x: 0, y: origin),
                    size: CGSize(width: width, height:  separatorHeight)
                )
                
                // put above content and set separator color
                separatorAttributes.zIndex = 1
                separatorAttributes.backgroundColor = separatorColor

                // move cursor
                origin += separatorAttributes.frame.height

                // collect attribute
                currentSeparatorAttributes.append(separatorAttributes)
            }
        }

        // update content size
        contentSize = CGSize(width: width, height: origin)
    }

    /// MARK: - Layout Attributes - Content Cell
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes: [UICollectionViewLayoutAttributes] = []
        
        // display separators
        for item in currentSeparatorAttributes where rect.intersects(item.frame) {
            attributes.append(item)
        }
        
        // display items
        for item in currentAttributes where rect.intersects(item.frame) {
            attributes.append(item)
        }
    
        return attributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return currentAttributes[indexPath.item]
    }

    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return previousAttributes[itemIndexPath.item]
    }
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return layoutAttributesForItem(at: itemIndexPath)
    }

    /// MARK: - Layout Attributes - Decoration View
    
    override public func layoutAttributesForDecorationView(
        ofKind elementKind: String,
        at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return currentSeparatorAttributes[indexPath.item]
    }

    override func initialLayoutAttributesForAppearingDecorationElement(ofKind elementKind: String, at decorationIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return previousSeparatorAttributes[decorationIndexPath.item]
    }

    override func finalLayoutAttributesForDisappearingDecorationElement(ofKind elementKind: String, at decorationIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return layoutAttributesForDecorationView(ofKind: elementKind, at: decorationIndexPath)
    }

    /// MARK: - Invalidation
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return false
    }

    /// MARK: - Collection View Info
    
    private var contentSize = CGSize.zero
    override var collectionViewContentSize: CGSize {
        return contentSize
    }
    
    /// MARK: - Private
    
    private func registerDecorationView() {
        self.register(SeparatorDecorationView.self, forDecorationViewOfKind: Constants.Separator.kind)
    }
}
