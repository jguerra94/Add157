//
//  ViewController.swift
//  DatePickerApp.JerryG
//
//  Created by student on 9/30/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myDatePicker: UIDatePicker!
    let dateFormatter: DateFormatter = DateFormatter()
    
    @IBAction func buttonTapped(_ sender: Any) {
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        // Do any additional setup after loading the view.
        }
        func showAlert(dateTime: String) {
            let alert = UIAlertController(title: "Selected Date and Time", message: "\(dateTime)", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in})
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
    }
    @IBAction func getCurrentDateTime(_ sender: UIButton) {
        let selectedDate: String = dateFormatter.string(from: myDatePicker.date)
        showAlert(dateTime: selectedDate)
    }
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let selectedDate: String = dateFormatter.string(from: sender.date)
        showAlert(dateTime: selectedDate)
    }


}

