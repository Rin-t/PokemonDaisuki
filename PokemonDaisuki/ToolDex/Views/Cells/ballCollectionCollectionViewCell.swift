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

        let sizeTransformer = SDImageResizingTransformer(size: CGSize(width: 100, height: 100),scaleMode: .aspectFill)
        let pipeLineTransformer = SDImagePipelineTransformer(transformers: [sizeTransformer])
        ballButton.sd_setImage(with: imageURL, for: .normal, placeholderImage: nil, options: SDWebImageOptions(), context: [.imageTransformer: pipeLineTransformer])
        ballButton.layer.cornerRadius = cellCornerRadius

        self.tappedButton = tappedButton
    }

    private func configureButton() {

    }


    @IBAction private func tappedButton(_ sender: UIButton) {
        tappedButton()
    }

}
