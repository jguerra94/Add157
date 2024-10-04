//
//  ViewController.swift
//  GroupTableViewApp.JerryG
//
//  Created by student on 10/3/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Grouping pets by category
    let petArray = [
        ["Mammals", "cat", "dog", "hamster", "gerbil", "rabbit"],
        ["Birds", "parakeet", "parrot", "canary", "finch"],
        ["Fish", "tropical fish", "goldfish", "sea horses"],
        ["Reptiles", "snake", "lizard", "turtle", "hermit crab"]
    ]
    
    let cellID = "cellID"

    @IBOutlet weak var petTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        petTable.dataSource = self
        petTable.delegate = self
    }
    
    // Number of sections (categories)
    func numberOfSections(in tableView: UITableView) -> Int {
        return petArray.count
    }

    // Number of rows in each section (excluding the first item which is the section title)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petArray[section].count - 1 // Subtract 1 because the first element is the section title
    }
    
    // Cell creation
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        // Accessing the pet at the current section and row
        cell?.textLabel?.text = petArray[indexPath.section][indexPath.row + 1] // Skip the first element (the section title)
        return cell!
    }
    
    // Header title for each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return petArray[section][0] // The first element in each section array is the section title
    }
    
    // DidSelectRow to show an alert with the selected pet
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = petArray[indexPath.section][indexPath.row + 1]
        let alert = UIAlertController(title: "Your Choice", message: "\(selectedItem)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
