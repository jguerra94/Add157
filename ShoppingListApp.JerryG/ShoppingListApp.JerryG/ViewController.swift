import UIKit

class ViewController: UIViewController {
    
    let fileName = "shoppingList.txt"
    
    @IBOutlet weak var displayShoppingList: UITextView!
  
    @IBOutlet weak var enterItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems(nil) // Load items when the view loads
    }
    
    // Adds a new item to the shopping list
    @IBAction func addItem(_ sender: Any) {
        guard let item = enterItem.text, !item.isEmpty else {
            print("Please enter an item.")
            return
        }
        
        saveItemToFile(item)
        loadItems(nil) // Reload the updated list
        enterItem.text = "" // Clear the text field after adding
    }
   
    // Loads all items from the shopping list
    @IBAction func loadItems(_ sender: Any?) {
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        
        do {
            let contents = try String(contentsOf: fileURL)
            displayShoppingList.text = contents // Display the list in the text view
        } catch {
            displayShoppingList.text = "Your shopping list is empty."
        }
    }
    
    // Deletes a specific item from the shopping list
    @IBAction func deleteItem(_ sender: Any) {
        guard let itemToDelete = enterItem.text, !itemToDelete.isEmpty else {
            print("Please enter an item to delete.")
            return
        }
        
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        
        do {
            let contents = try String(contentsOf: fileURL)
            var itemList = contents.components(separatedBy: "\n").filter { !$0.isEmpty }
            
            if let index = itemList.firstIndex(of: itemToDelete) {
                itemList.remove(at: index) // Remove the item
                let updatedList = itemList.joined(separator: "\n")
                try updatedList.write(to: fileURL, atomically: true, encoding: .utf8)
                loadItems(nil) // Reload the updated list
                enterItem.text = "" // Clear the text field after deletion
            } else {
                print("Item not found in the list.")
            }
        } catch {
            print("Error deleting item from file.")
        }
    }
    
    // Helper function to get the Documents directory path
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // Saves a new item to the shopping list file
    func saveItemToFile(_ item: String) {
        let fileURL = getDocumentsDirectory().appendingPathComponent(fileName)
        
        do {
            let currentText = try String(contentsOf: fileURL)
            let newText = currentText + item + "\n" // Append new item with a newline
            try newText.write(to: fileURL, atomically: true, encoding: .utf8)
        } catch {
            // If the file doesn't exist yet, create it with the first item
            try? item.write(to: fileURL, atomically: true, encoding: .utf8)
        }
    }
}

