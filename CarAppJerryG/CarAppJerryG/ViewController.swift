//
//  ViewController.swift
//  CarAppJerryG
//
//  Created by student on 9/16/24.
//

import UIKit

class ViewController: UIViewController {
    // all mutable buttons and label linked to storyboard
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
        carImageView.image = UIImage(named: "black_car")
        updateMsrpLabel()
    }
    func updateMsrpLabel(){
        msrpLabel.text = "MSRP + $\(msrp + selectedPackagePrice)"
    }
    @IBAction func darkRedButtonTapped(_ sender:UIButton ){
        carImageView.image = UIImage(named: "darkred_car")
    }
    @IBAction func silverButtonTapped(_ sender:UIButton){
        carImageView.image = UIImage(named: "silver_car")
    }
    @IBAction func blackButtonTapped(_ sender:UIButton){
        carImageView.image = UIImage(named: "black_car")
    
}

    @IBAction func plusPackageButtonTapped(_ sender:UIButton){
      msrp += 2500
        updateMsrpLabel()
    }
    @IBAction func premiumPackageButtonTapped(_ sender:UIButton){
      var selectedPackagePrice = 5000
        updateMsrpLabel()
    }
    @IBAction func diamondPackageButtonTapped(_ sender:UIButton){
        var selectedPackagePrice = 8000
        updateMsrpLabel()
    }
    }
