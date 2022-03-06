//
//  ReadyForQuizViewController.swift
//  PokemonDaisuki
//
//  Created by JohnnyToda on 2022/01/23.
//

import UIKit

final class ReadyForQuiz: UIViewController {

    @IBOutlet private weak var startQuizButton: UIButton! {
        didSet{
            startQuizButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }

    @objc private func didTapButton() {
        let vc = TestQuizViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
