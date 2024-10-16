//
//  ViewController.swift
//  DBApp.JerryG
//
//  Created by student on 10/14/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var dataManager: NSManagedObjectContext!
    var listArray = [NSManagedObject]()
    
    @IBOutlet weak var enterGuitarDescription: UITextField!
    @IBOutlet weak var displayDataHere: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dataManager = appDelegate.persistentContainer.viewContext
        displayDataHere.text?.removeAll()
        fetchData()
    }
    
    @IBAction func saveRecord(_ sender: UIButton) {
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: "Item", into: dataManager)
        newEntity.setValue(enterGuitarDescription.text!, forKey: "about")
        
        do {
            try dataManager.save()
            listArray.append(newEntity)
        } catch {
            print("Error saving data")
        }
        
        displayDataHere.text?.removeAll()
        enterGuitarDescription.text?.removeAll()
        fetchData()
    }
    
    @IBAction func deleteRecord(_ sender: UIButton) {
        let deleteItem = enterGuitarDescription.text!
        for item in listArray {
            if item.value(forKey: "about") as! String == deleteItem {
                dataManager.delete(item)
                do {
                    try dataManager.save()
                } catch {
                    print("Error deleting data")
                }
                displayDataHere.text?.removeAll()
                enterGuitarDescription.text?.removeAll()
                fetchData()
                break // Avoid modifying the array while iterating
            }
        }
    }
    
    func fetchData() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Item")
        do {
            let result = try dataManager.fetch(fetchRequest)
            listArray = result as! [NSManagedObject]
            displayDataHere.text?.removeAll()
            for item in listArray {
                let product = item.value(forKey: "about") as! String
                displayDataHere.text! += product + "\n"
            }
        } catch {
            print("Error retrieving data")
        }
    }
}


