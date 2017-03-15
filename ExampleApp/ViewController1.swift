//
//  ViewController1.swift
//  ExampleApp
//
//  Created by Emil Wojtaszek on 12/03/2017.
//  Copyright © 2017 AppUnite Sp. z o.o. All rights reserved.
//

import UIKit

class ViewController1: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // since this controller is initialized from code we need to register all collection view elements
        collectionView?.register(TextCell.self,
                                 forCellWithReuseIdentifier: TextCell.reuseIdentifier)

        // setup collection view layout (in this case subclass of UICollectionViewFlowLayout)
        let layout = self.collectionViewLayout as! DecorationLayout
        layout.itemSize = CGSize(width: self.view.frame.width, height: 44)
        layout.minimumLineSpacing = 2.0
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
        return 18
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
