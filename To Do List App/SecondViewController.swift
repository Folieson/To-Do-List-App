//
//  SecondViewController.swift
//  To Do List App
//
//  Created by Андрей Понамарчук on 09.08.2018.
//  Copyright © 2018 Андрей Понамарчук. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var toDoTextField: UITextField!
    @IBAction func addItemToToDoList(_ sender: UIButton) {
        
        let toDoListObject = UserDefaults.standard.object(forKey: "items")
        var toDoListArray: [String]
        if  let tempToDoListArray = toDoListObject as? [String] {
            toDoListArray = tempToDoListArray
            toDoListArray.append(toDoTextField.text!)
        } else {
            toDoListArray = [toDoTextField.text!]
        }
        
        UserDefaults.standard.set(toDoListArray, forKey: "items")
        
        toDoTextField.text = ""
        
//        if let newItem = toDoTextField.text {
//            toDoListArray.append(newItem)
//            UserDefaults.standard.set(toDoListArray, forKey: "toDoList")
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

