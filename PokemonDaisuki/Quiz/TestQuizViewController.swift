//
//  TestQuizViewController.swift
//  PokemonDaisuki
//
//  Created by JohnnyToda on 2022/01/23.
//

import UIKit

class TestQuizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.setRightBarButton(UIBarButtonItem(title: "Quit", style: .done, target: self,action: #selector(didTapQuitButton(_:))), animated: false)
    }
    // 『Quit(戻る)』ボタンをタップした時の処理
    @objc private func didTapQuitButton(_ sender: UIResponder) {
        // MainStoryboardに遷移する。
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
