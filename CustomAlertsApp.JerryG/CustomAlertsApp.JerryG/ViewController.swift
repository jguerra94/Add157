//
//  ViewController.swift
//  CustomAlertsApp.JerryG
//
//  Created by student on 9/30/24.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var reminderLabel: UILabel!
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    // DateFormatter to format the date and time
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Configure the date picker
        datePicker.datePickerMode = .dateAndTime
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
    }
    
    // Action for setting the reminder
    @IBAction func setReminderButtonTapped(_ sender: Any) {
        // Create an alert with 3 options for event types
        let alert = UIAlertController(title: "Choose Event", message: "Select the type of event", preferredStyle: .alert)
        
        // Meeting event action
        let meetingAction = UIAlertAction(title: "Meeting", style: .default) { _ in
            self.updateReminderLabel(eventType: "Meeting")
        }
        
        // Doctor appointment event action
        let doctorAction = UIAlertAction(title: "Dr Appt.", style: .default) { _ in
            self.updateReminderLabel(eventType: "Dr Appt.")
        }
        
        // Family event action
        let familyAction = UIAlertAction(title: "Family Event", style: .default) { _ in
            self.updateReminderLabel(eventType: "Family Event")
        }
        
        // Add actions to the alert
        alert.addAction(meetingAction)
        alert.addAction(doctorAction)
        alert.addAction(familyAction)
        
        // Present the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    // Function to update the reminder label based on the selected event and date/time
    func updateReminderLabel(eventType: String) {
        // Get the selected date and time from the date picker
        let selectedDate = dateFormatter.string(from: datePicker.date)
        
        // Update the label with the selected event type and date
        reminderLabel.text = "\(eventType) scheduled for \(selectedDate)"
    }
}

