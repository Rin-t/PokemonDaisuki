//
//  SelectToolsTypeViewController.swift
//  PokemonDaisuki
//
//  Created by Rin on 2021/12/13.
//

import UIKit

final class SelectToolsTypeViewController: UIViewController {

    // Propaties
    @IBOutlet private weak var collectionView: UICollectionView!

    // Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        FetchAPIs.decodeItemCategoriesData { items in
            print(items)
        }
    }

    // Methods
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ToolsTypeCollectionViewCell.nib(), forCellWithReuseIdentifier: ToolsTypeCollectionViewCell.identifier)
        let flowLayout = UICollectionViewFlowLayout()
        let cellWidth = view.frame.width / 2.5
        // buttonが正方形になるようにheightは 5/4倍しています。
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth * 5 / 4)
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        collectionView.collectionViewLayout = flowLayout
    }
}

extension SelectToolsTypeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToolsTypeCollectionViewCell.identifier, for: indexPath) as! ToolsTypeCollectionViewCell
        cell.configure(title: "ボール", cellCornerRadius: view.frame.width / 5) {
            print(indexPath)
        }
        return cell
    }

}
