//
//  ViewController.swift
//  TableViewIndexApp.JerryG
//
//  Created by student on 10/3/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let petArray = [
        ["Mammals", "cat", "dog", "hamster", "gerbil", "rabbit"],
        ["Birds", "parakeet", "parrot", "canary", "finch"],
        ["Fish", "tropical fish", "goldfish", "sea horses"],
        ["Reptiles", "snake", "lizard", "turtle", "hermit crab"]
    ]
    
    let indexArray = ["🐥B", "🐠F", "🐕M", "🦎R"]   
    let cellID = "cellID"

    @IBOutlet weak var petTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        petTable.dataSource = self
        petTable.delegate = self
        petTable.sectionIndexColor = UIColor.white
        petTable.sectionIndexBackgroundColor = UIColor.black
        petTable.sectionIndexTrackingBackgroundColor = UIColor.darkGray
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {   // Fixed method name
        return petArray[section].count - 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {  // Fixed return type
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = petArray[indexPath.section][indexPath.row + 1]  // Access pet name correctly
        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = petArray[indexPath.section][indexPath.row + 1]
        let alert = UIAlertController(title: "Your Choice", message: "\(selectedItem)", preferredStyle: .alert)  // Fixed string interpolation
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return petArray.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return petArray[section][0]
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArray
    }
}
