//
//  DecorationLayout.swift
//  ExampleApp
//
//  Created by Emil Wojtaszek on 12/03/2017.
//  Copyright © 2017 AppUnite Sp. z o.o. All rights reserved.
//

import UIKit

class DecorationLayout: UICollectionViewFlowLayout {

    /// struct of layout constants
    private struct Constants {
        struct Footer {
            static let kind = "footer"
            static let height: CGFloat = 100.0
            static let indexPath = IndexPath(item: 1, section: 0)
        }
    }
    
    /// generated additional layout attributed
    private var footerLayoutAttributes: UICollectionViewLayoutAttributes?

    required public override init() {
        super.init()
        self.registerDecorationView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.registerDecorationView()
    }

    /// MARK: - Preparation

    override func prepare() {
        super.prepare()
        
        // on each bounds change regenerate footer attributes
        prepareFooterViewAttributes()
    }

    fileprivate func prepareFooterViewAttributes() {
        guard let collectionView = collectionView else { return }

        // create attributes for footer decoration view
        footerLayoutAttributes = UICollectionViewLayoutAttributes(
            forDecorationViewOfKind: Constants.Footer.kind,
            with: Constants.Footer.indexPath
        )

        // put it below other content
        footerLayoutAttributes!.zIndex = -1

        // calculate size (put at the end of content and stick to bottom edge)
        let contentSize = self.collectionViewContentSize
        let height = max(0, collectionView.contentOffset.y + collectionView.frame.height - collectionView.contentInset.bottom - contentSize.height)
        let size = CGSize(width: collectionView.frame.width, height: max(Constants.Footer.height, height))
        let origin = CGPoint(x: 0.0, y: contentSize.height)
        let factor = min(max(height / Constants.Footer.height, 0.0), 1.0)
        
        // assign all attributes
        footerLayoutAttributes!.frame = CGRect(origin: origin, size: size)
        footerLayoutAttributes!.alpha = factor
        footerLayoutAttributes!.transform = CGAffineTransform(scaleX: factor, y: factor)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // inherited attributes from UICollectionViewFlowLayout implementation
        var attributes = super.layoutAttributesForElements(in: rect) ?? []

        guard let footerAttributes = footerLayoutAttributes else {
            return attributes
        }

        // append to list of visible attributes when intersect with visible rect
        if rect.intersects(footerAttributes.frame) {
            attributes.append(footerAttributes)
        }

        return attributes
    }
    
    override public func layoutAttributesForDecorationView(
        ofKind elementKind: String,
        at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return footerLayoutAttributes
    }

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    /// MARK: - Private
    
    private func registerDecorationView() {
        /// decorations view in contrast to cells and supplementary view do no represents any data
        /// and are registered directly in layout
        self.register(EmojiDecorationView.self, forDecorationViewOfKind: Constants.Footer.kind)
    }
}
