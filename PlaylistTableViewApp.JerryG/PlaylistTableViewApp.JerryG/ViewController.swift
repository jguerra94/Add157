//
//  ViewController.swift
//  PlaylistTableViewApp.JerryG
//
//  Created by student on 10/5/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let songsArray = [
        ["Coldplay", "Viva La Vida", "Clocks", "Yellow", "Paradise", "Sky Full of Stars"],
        ["Red Hot Chili Peppers", "Snow", "Californication", "Can't Stop", "Under the Bridge", "Otherside"],
        ["Linkin Park", "What I've Done", "Numb", "New Divide", "Papercut", "Faint"]
    ]
    
    let cellID = "cellID"

    @IBOutlet weak var songsTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        songsTable.dataSource = self
        songsTable.delegate = self
    }

    // MARK: - UITableViewDataSource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return songsArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsArray[section].count - 1 // Subtracting 1 for band name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        
        // Access the correct song by offsetting by 1 to skip the band name
        let song = songsArray[indexPath.section][indexPath.row + 1]
        cell?.textLabel?.text = song
        
        return cell!
    }

    // MARK: - UITableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return songsArray[section][0] // Band name is at index 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Get the selected song, offset by 1 to skip the band name
        let selectedItem = songsArray[indexPath.section][indexPath.row + 1]
        
        let alert = UIAlertController(title: "Now Playing", message: "\(selectedItem)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

