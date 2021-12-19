//
//  ToolsTypeCollectionViewCell.swift
//  PokemonDaisuki
//
//  Created by Rin on 2021/12/13.
//

import UIKit

final class ToolsTypeCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var toolTypeButton: UIButton!
    @IBOutlet private weak var toolTypeLabel: UILabel!

    static let identifier = "ToolsTypeCollectionViewCell"
    static func nib() -> UINib {
        UINib(nibName: identifier, bundle: nil)
    }

   private var tappedButton = { () -> Void in }

    func configure(title: String, cellCornerRadius: CGFloat, tappedButton: @escaping () -> Void) {
        toolTypeLabel.text = title
        toolTypeLabel.textColor = .black
        toolTypeButton.backgroundColor = .systemBlue
        toolTypeButton.tintColor = .white
        toolTypeButton.layer.cornerRadius = cellCornerRadius
        self.tappedButton = tappedButton
    }

    @IBAction private func tappedButton(_ sender: UIButton) {
        tappedButton()
    }

}
