//
//  BallDetailViewController.swift
//  PokemonDaisuki
//
//  Created by Rin on 2022/03/12.
//

import UIKit
import SDWebImage

final class BallDetailViewController: UIViewController {

    // Outlets
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var imageBaseView: UIView!
    @IBOutlet private weak var ballImageView: UIImageView!
    @IBOutlet private weak var textBaseView: UIView!
    @IBOutlet private weak var descriptionTextView: UITextView!

    // Properties
    let ball: Ball

    // LifeCycles
    init(ball: Ball) {
        self.ball = ball
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

}

private extension BallDetailViewController {

    func setupViews() {
        [
            nameLabel,
            imageBaseView,
            textBaseView,
            descriptionTextView
        ].forEach { $0?.layer.cornerRadius = 8 }

        nameLabel.clipsToBounds = true
        nameLabel.text = ball.name

        descriptionTextView.layer.borderColor = UIColor.black.cgColor
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.text = ball.effectEntries[0].effect

        let imageURL = URL(string: ball.sprites.default)
        ballImageView.sd_setImage(with: imageURL, completed: nil)
    }
}
