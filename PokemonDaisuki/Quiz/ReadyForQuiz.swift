//
//  ReadyForQuizViewController.swift
//  PokemonDaisuki
//
//  Created by JohnnyToda on 2022/01/23.
//

import UIKit

class ReadyForQuiz: UIViewController {

    
    @IBOutlet weak var startQuizButton: UIButton! {
        didSet{
            startQuizButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @objc func didTapButton() {
        let vc = TestQuizViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
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
