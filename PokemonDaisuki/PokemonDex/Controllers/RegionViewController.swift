//
//  RegionViewController.swift
//  PokemonDaisuki
//
//  Created by KS on 2021/12/30.
//

import UIKit

final class RegionViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RegionViewCell.regionViewNib(), forCellWithReuseIdentifier: RegionViewCell.identifier)
        let flowLayout = UICollectionViewFlowLayout()
        let cellWidth = view.frame.width / 2.5

        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth * 5 / 4)
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        collectionView.collectionViewLayout = flowLayout
    }
}

extension RegionViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RegionViewCell.identifier, for: indexPath) as! RegionViewCell

        cell.configure(title: "地方", cellCornerRadius: view.frame.width / 5) {
            print(indexPath)
        }
        return cell
    }
}
