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
    }

    // Methods
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ToolsTypeCollectionViewCell.nib(), forCellWithReuseIdentifier: ToolsTypeCollectionViewCell.identifire)
        let flowLayout = UICollectionViewFlowLayout()
        let cellWidth = view.frame.width / 2.5
        // cellの高さ
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth * 5 / 4)
        flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 30, bottom: 16, right: 30)
        collectionView.collectionViewLayout = flowLayout
    }
}

extension SelectToolsTypeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToolsTypeCollectionViewCell.identifire, for: indexPath) as! ToolsTypeCollectionViewCell
        cell.configure(title: "ボール", cellCornerRadius: view.frame.width / 5) {
            print(indexPath)
        }
        return cell
    }

}
