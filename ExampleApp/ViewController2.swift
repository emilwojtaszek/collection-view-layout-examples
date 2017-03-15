//
//  ViewController2.swift
//  ExampleApp
//
//  Created by Emil Wojtaszek on 14/03/2017.
//  Copyright © 2017 AppUnite Sp. z o.o. All rights reserved.
//

import UIKit

class ViewController2: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // register elements
        collectionView?.register(TextCell.self,
                                 forCellWithReuseIdentifier: TextCell.reuseIdentifier)

        // setup collection view layout
        let layout = self.collectionViewLayout as! AnimationLayout
        layout.separatorColor = .blue
        layout.separatorHeight = 4.0
    }
    
    /// MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // dequeue cell
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TextCell.reuseIdentifier,
            for: indexPath) as! TextCell
        
        // update text
        cell.titleLabel.text = "Cell: (\(indexPath.section),\(indexPath.row))"
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    /// MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// update layout property and set index path of selected cell
        let layout = self.collectionViewLayout as! AnimationLayout
        layout.expandedIndexPath = layout.expandedIndexPath == indexPath ? nil : indexPath

        /// invalidation layout in animation block
        UIView.animate(
            withDuration: 0.4,
            delay: 0.0,
            usingSpringWithDamping: 1.0,
            initialSpringVelocity: 0.0,
            options: UIViewAnimationOptions(),
            animations: {
                layout.invalidateLayout()
                self.collectionView?.layoutIfNeeded()
        },
            completion: nil
        )
    }
}
