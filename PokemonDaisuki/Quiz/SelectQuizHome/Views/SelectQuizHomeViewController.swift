//
//  ReadyForQuizViewController.swift
//  PokemonDaisuki
//
//  Created by JohnnyToda on 2022/01/23.
//

import UIKit

final class SelectQuizHomeViewController: UIViewController {
    @IBOutlet private weak var startQuizButton: UIButton! {
        didSet{
            startQuizButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }

    @objc private func didTapButton() {
        showQuizVC()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    private func showQuizVC() {
        let vc = QuizViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
}
