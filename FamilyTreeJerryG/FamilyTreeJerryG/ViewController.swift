//
//  ViewController.swift
//  FamilyTreeJerryG
//
//  Created by student on 9/20/24.
//

import UIKit

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var superMarioParents: UIImageView!
    
    @IBAction func kidsButtonTapped(_ sender: UIButton) {
        // Step 1: Reference the correct storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Step 2: Instantiate the SecondViewController using its Storyboard ID
        if let secondVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController {
            
            // Step 3: Animate transition
            UIView.transition(with: self.view.window!,
                              duration: 2.0,  // Corrected to lowercase 'duration'
                              options: .transitionFlipFromBottom,  // Added 'Bottom'
                              animations: {
                                  // Step 4: Present the second view controller
                                  self.present(secondVC, animated: false, completion: nil)  // Corrected variable name
                              },
                              completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

