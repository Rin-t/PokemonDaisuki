//
//  RegionViewCell.swift
//  PokemonDaisuki
//
//  Created by KS on 2021/12/30.
//

import UIKit

class RegionViewCell: UICollectionViewCell {


    @IBOutlet private weak var regionButton: UIButton!
    @IBOutlet private weak var regionLabel: UILabel!

    static let identifier = "RegionViewCell"
    static func regionViewNib() -> UINib {
        UINib(nibName: identifier, bundle: nil)
    }

    private var tappedButton = { () -> Void in }

    func configure(title: String, cellCornerRadius: CGFloat, tappedButton: @escaping () -> Void) {
        regionLabel.text = title
        regionLabel.textColor = .black
        regionButton.backgroundColor = .systemBlue
        regionButton.tintColor = .white
        regionButton.layer.cornerRadius = cellCornerRadius
        self.tappedButton = tappedButton
    }

    @IBAction func tappedRegionButton(_ sender: Any) {
        tappedButton()
    }

}
