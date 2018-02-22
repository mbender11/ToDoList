//
//  SecondViewController.swift
//  ToDoList
//
//  Created by Mason Bender on 2/21/18.
//  Copyright © 2018 Mason Bender. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemText: UITextField!
    
    @IBAction func addItem(_ sender: Any) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        var items: [String]
        
        if let newItems = itemsObject as? [String] {
            
            items = newItems
            items.append(itemText.text!)
            
        } else {
            
            items = [itemText.text!]
            
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        
        // reset text field
        itemText.text = ""
        
    }
    
    // close keyboard when touching outside of keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // close keyboard when return is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

