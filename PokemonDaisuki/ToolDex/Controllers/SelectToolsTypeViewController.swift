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

    private var balls = [Ball]()

    // Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchBallData()
    }

    private func fetchBallData() {
        FetchAPIs.decodeBallData { [weak self] balls in
            self?.balls = balls
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }

    // Methods
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ballCollectionCollectionViewCell.nib(), forCellWithReuseIdentifier: ballCollectionCollectionViewCell.identifier)
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
        balls.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ballCollectionCollectionViewCell.identifier, for: indexPath) as! ballCollectionCollectionViewCell
        let imageURL = URL(string: balls[indexPath.row].sprites.default)
        cell.configure(title: balls[indexPath.row].name, cellCornerRadius: view.frame.width / 5, imageURL: imageURL) {
            print(indexPath)
        }
        return cell
    }

}
