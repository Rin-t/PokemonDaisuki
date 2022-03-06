//
//  TestQuizViewController.swift
//  PokemonDaisuki
//
//  Created by JohnnyToda on 2022/01/23.
//

import UIKit

final class QuizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.setRightBarButton(UIBarButtonItem(title: "Quit", style: .done, target: self,action: #selector(didTapQuitButton(_:))), animated: false)
    }
    // 『Quit(戻る)』ボタンをタップした時の処理
    @objc private func didTapQuitButton(_ sender: UIResponder) {
        // MainStoryboardに遷移する。
        dismiss(animated: true, completion: nil)
    }
}
