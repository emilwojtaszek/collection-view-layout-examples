//
//  ViewController3.swift
//  ExampleApp
//
//  Created by Emil Wojtaszek on 12/02/2017.
//  Copyright © 2017 AppUnite Sp. z o.o. All rights reserved.
//

import UIKit

class ViewController3: UICollectionViewController {
    
    let models: [String] = [
        "0. Maecenas ultricies est mattis quam sagittis bibendum.",
        "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit",
        "2. Donec luctus tincidunt facilisis",
        "3. Ut semper velit libero, non scelerisque ante ullamcorper a. Vivamus pellentesque nisl in ornare vehicula",
        "4. Sed ac tempus libero. Integer mattis nisl vitae hendrerit bibendum",
        "5. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos",
        "6. Quisque lacinia nibh ac tellus venenatis, ac efficitur justo mollis. Duis eget fermentum leo.",
        "7. Morbi pharetra, mauris lacinia mattis laoreet, magna ligula lacinia arcu, a hendrerit nisl dolor vitae purus. Morbi ultrices accumsan metus a porta. Aliquam erat volutpat",
        "8. Nulla facilisi. Vivamus convallis eget nulla sit amet pellentesque.",
        "9. Nulla facilisi. Vivamus sed leo augue. Fusce vel felis augue. Mauris aliquam quis dui vel dapibus. Quisque luctus nisi in gravida sollicitudin. ",
        "10. Nullam congue non mauris ultrices volutpat.",
        "11. Pellentesque fermentum, arcu id vehicula condimentum, urna massa finibus nunc, et fermentum mauris ex et eros.",
        "12. Nam finibus dolor a mauris ultrices, at varius eros porta. Etiam dictum sapien velit, eu pellentesque magna faucibus suscipit.",
        "13. Ut pellentesque ullamcorper congue. Morbi gravida, arcu sit amet dictum tempor, ligula sem tincidunt erat, eget tristique neque urna nec neque.",
        "14. Ut non faucibus odio. Phasellus porta est lacus, et rhoncus augue tincidunt ut.",
        "15. In vulputate massa quis rutrum consequat. Pellentesque consectetur diam at nunc condimentum blandit in quis lectus.",
        "16. Aliquam maximus posuere ex quis efficitur.",
        "17. Fusce vehicula tincidunt tempor. Pellentesque sed molestie tellus.",
        "18. Morbi tellus arcu, accumsan non risus aliquam, elementum fringilla urna."
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // register cells
        collectionView?.register(Cell.self, forCellWithReuseIdentifier: Cell.reuseIdentifier)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.models.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath) as! Cell
        cell.titleLabel.text = models[indexPath.row]
        return cell
    }
}
