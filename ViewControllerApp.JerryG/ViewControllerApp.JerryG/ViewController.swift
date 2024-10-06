//
//  ViewController.swift
//  ViewControllerApp.JerryG
//
//  Created by student on 10/4/24.
//

import UIKit

// Subclass UITableViewController, not UITableView
class TableViewController: UITableViewController {
    
    let petArray = ["cat", "dog", "parakeet", "parrot", "canary", "finch", "tropical fish", "goldfish", "sea horses", "hamster", "gerbil", "rabbit", "turtle", "snake", "lizard", "hermit crab"]
    let cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // You don't need to set the dataSource or delegate since UITableViewController already handles this
        // tableView.delegate = self
        // tableView.dataSource = self
        
        // Register the cell ID if necessary (e.g., if you're using reusable cells)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = petArray[indexPath.row]
        let alert = UIAlertController(title: "Your Choice", message: "\(selectedItem)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petArray.count
    }

    // Return a UITableViewCell for each row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = petArray[indexPath.row]
        return cell!
    }
}
