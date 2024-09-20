//
//  SecondViewController.swift
//  Chapter4EXJerryG
//
//  Created by student on 9/20/24.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup if needed
    }

    @IBAction func returnButtonTapped(_ sender: UIButton) {
        // Custom flip-left animation with 2-second duration
        UIView.transition(with: self.view.window!,
                          duration: 2.0,
                          options: .transitionFlipFromLeft,
                          animations: {
                            self.dismiss(animated: false, completion: nil)
        }, completion: nil)
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


