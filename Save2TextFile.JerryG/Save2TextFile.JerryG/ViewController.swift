//
//  ViewController.swift
//  Save2TextFile.JerryG
//
//  Created by student on 10/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func writeMyText(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            try typeTexthere.text.write(to: url!, atomically: true, encoding: String.Encoding.utf8)
        }
        catch {
            print("Error writing file")
        }
    }
    
    @IBAction func readMyText(_ sender: Any) {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        let url = urls.last?.appendingPathComponent("file.text")
        do {
            let fileContent = try String(contentsOf: url!, encoding: String.Encoding.utf8)
            displayTextHere.text = fileContent
        }
        catch{
            print("Error reading file")
        }
    }
    
    @IBOutlet weak var typeTexthere: UITextView!
    
    
    @IBOutlet weak var displayTextHere: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        typeTexthere.text = "Type your text right here"
        displayTextHere.text = ""
    }


}

