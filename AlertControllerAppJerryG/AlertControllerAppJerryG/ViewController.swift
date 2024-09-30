//
//  ViewController.swift
//  AlertControllerAppJerryG
//
//  Created by student on 9/29/24.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func alertAction(_ sender: Any) {
        let alert = UIAlertController(title: "Warning", message: "Zombies are loose!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in})
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

