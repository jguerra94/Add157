//
//  ViewController.swift
//  AlertButtonsApp.JerryG
//
//  Created by student on 9/29/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alertLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func alertButton(_ sender: Any) {
        let alert = UIAlertController(title: "Warning", message: "Zombies are loose!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in })
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {action -> Void in
            self.alertLabel.text = "Cancel"})
        let destroyAction = UIAlertAction(title: "Destroy", style: .destructive, handler: {action -> Void in
            self.alertLabel.text = "Destroy"})
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        alert.addAction(destroyAction)
        self.present(alert, animated: true, completion: nil)
    }
    
 
    

}

