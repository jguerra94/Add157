//
//  ViewController.swift
//  CarAppJerryG
//
//  Created by student on 9/16/24.
//

import UIKit

class ViewController: UIViewController {
    // all mutable buttons and label linked to storyboard
    // initialize buttons and label 
    @IBOutlet var darkRedButton: UIButton!
    @IBOutlet var silverButton: UIButton!
    @IBOutlet var blackButton: UIButton!
    @IBOutlet var plusPackage: UIButton!
    @IBOutlet var premiumPackage: UIButton!
    @IBOutlet var diamondPackage: UIButton!
    
    @IBOutlet var msrpLabel: UILabel!
    
    @IBOutlet var carImageView: UIImageView!
    // set initial variable
    var msrp:Int = 69900// initial set price without packages
    var selectedPackagePrice:Int = 0 // keeps track of selected package price
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // set default car image to black when user loads the app.
        carImageView.image = UIImage(named: "black_car.jpg")
        updateMsrpLabel()
    }
    func updateMsrpLabel(){
        msrpLabel.text = "MSRP + $\(msrp + selectedPackagePrice)"
    }
    // change outlet to action
    @IBAction func darkRedButtonTapped(_ sender:UIButton ){
        carImageView.image = UIImage(named: "darkred_car.jpg")
    }
    // change outlet to action
    @IBAction func silverButtonTapped(_ sender:UIButton){
        carImageView.image = UIImage(named: "silver_car.jpg")
    }
    @IBAction func blackButtonTapped(_ sender:UIButton){
        carImageView.image = UIImage(named: "black_car.jpg")
}
    // verify action and connect properly
    @IBAction func plusActionButton(_ sender: Any) {
        msrp = 72400
          updateMsrpLabel()
    }
//    @IBAction func plusPackageButtonTapped(_ sender:UIButton){
//      msrp += 2500
//        updateMsrpLabel()
//    }
    // connect action
    @IBAction func premiumPackageButtonTapped(_ sender:UIButton){
       msrp = 74900
        updateMsrpLabel()
        
    }
    // connect action
    @IBAction func diamondPackageButtonTapped(_ sender:UIButton){
         msrp = 77000
        updateMsrpLabel()
    }
    }
