//
//  ViewController.swift
//  Chapter4EXJerryG
//
//  Created by student on 9/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressButtonTapped(_ sender: UIButton) {
        // Perform the flip animation to transition to the second view controller
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            
            // Custom flip-left animation with 2-second duration
            UIView.transition(with: self.view.window!,
                              duration: 2.0,
                              options: .transitionFlipFromLeft,
                              animations: {
                                self.present(secondVC, animated: false, completion: nil)
            }, completion: nil)
        }
    }
}


        
        
    







