//
//  SecondViewController.swift
//  FamilyTreeJerryG
//
//  Created by student on 9/20/24.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Any additional setup after loading the view.
    }

   
    @IBOutlet var superMarioBros: UIImageView!
    @IBAction func seeParentsButtonTapped(_ sender: UIButton) {
        // Step 1: Reference the Main.storyboard
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Step 2: Instantiate ViewController using its Storyboard ID
        guard let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
            print("ViewController not found")
            return
        }
        
        // Step 3: Set the modal presentation style
        viewController.modalPresentationStyle = .fullScreen
        
        // Step 4: Perform the flip-from-top transition
        UIView.transition(with: self.view.window!,
                          duration: 2.0,
                          options: .transitionFlipFromTop,  // Change to flip from top
                          animations: {
                              // Present ViewController without additional animation
                              self.present(viewController, animated: false, completion: nil)
                          },
                          completion: nil)
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


