//
//  ToolsTypeCollectionViewCell.swift
//  PokemonDaisuki
//
//  Created by Rin on 2021/12/13.
//

import UIKit
import SDWebImage

final class ballCollectionCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var ballButton: UIButton! {
        didSet {
            ballButton.backgroundColor = .white
            ballButton.layer.borderWidth = 2
            ballButton.layer.borderColor = UIColor.black.cgColor
            ballButton.tintColor = .white
        }
    }
    @IBOutlet private weak var ballName: UILabel! {
        didSet {
            ballName.textColor = .black
        }
    }

    static let identifier = "ToolsTypeCollectionViewCell"
    static func nib() -> UINib {
        UINib(nibName: identifier, bundle: nil)
    }

   private var tappedButton = { () -> Void in }

    func configure(title: String, cellCornerRadius: CGFloat, imageURL: URL?, tappedButton: @escaping () -> Void) {
        ballName.text = title
        ballButton.layer.cornerRadius = cellCornerRadius
        ballButton.sd_setImage(with: imageURL, for: .normal, completed: nil)
        self.tappedButton = tappedButton
    }

    @IBAction private func tappedButton(_ sender: UIButton) {
        tappedButton()
    }

}
