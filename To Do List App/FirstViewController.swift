//
//  FirstViewController.swift
//  To Do List App
//
//  Created by Андрей Понамарчук on 09.08.2018.
//  Copyright © 2018 Андрей Понамарчук. All rights reserved.
//

import UIKit

var toDoListArray: [String] = []

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoListArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = toDoListArray[indexPath.row] 
        
//        let toDoListObject = UserDefaults.standard.object(forKey: "toDoList")
//        if let toDoList = toDoListObject as? Array<String?> {
//            cell.textLabel?.text = toDoList[indexPath.row]
//        }
       
        return cell
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let toDoListObject = UserDefaults.standard.object(forKey: "items")
        if  let tempToDoListArray = toDoListObject as? [String] {
            toDoListArray = tempToDoListArray
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let toDoListObject = UserDefaults.standard.object(forKey: "items")
        if  let tempToDoListArray = toDoListObject as? [String] {
            toDoListArray = tempToDoListArray
        }
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            toDoListArray.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(toDoListArray, forKey: "items")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

