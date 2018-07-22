//
//  ViewController.swift
//  TODOEY
//
//  Created by Riken Maharjan on 7/22/18.
//  Copyright © 2018 Riken Maharjan. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    
    let defaults = UserDefaults.standard
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add item", style: .default) {
            
            (action) in
            
            
            var item = Item()
            item.title = textField.text!
            
            self.itemArray.append(item)
            
            self.defaults.set(self.itemArray, forKey:"TodoListArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        
        var item1 = Item()
        item1.title = "Riken"
        item1.done = true
        
        
        var item2 = Item()
        item2.title = "Riken1"
        
        var item3 = Item()
        item3.title = "Riken2"
        
        itemArray.append(item1)
        itemArray.append(item2)
        itemArray.append(item3)
        itemArray.append(item3)
        itemArray.append(item3)
        itemArray.append(item3)
        
        
                if let items = defaults.array(forKey: "TodoListArray") as? [String]{
        
                    itemArray = items
        
                }
        


        
    }
    
   
    // MARK - TableView DataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell"){
            
            cell.textLabel?.text = itemArray[indexPath.row].title
            
            
          cell.accessoryType =   itemArray[indexPath.row].done ? .checkmark :  .none
            
            return cell
            
        }
        
       return UITableViewCell()
        
    }
    
    
    // MARK - Tableview delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
       
        tableView.deselectRow(at: indexPath, animated: true)
        
        tableView.reloadData()
        
        
    }

   


}

