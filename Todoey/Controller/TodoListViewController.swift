//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    
    let itemArray = [
        "Find Mike", "Buy Eggos", "Destory Demogorgon"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if #available(iOS 14.0, *) {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            
            content.text = itemArray[indexPath.row]
            cell.contentConfiguration = content
            return cell
        } else {
            // Fallback on earlier versions
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! ItemTableViewCell
            
            cell.itemLabel.text = itemArray[indexPath.row]
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else  {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Add New Todey Item", message: nil , preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
//            what will once the user clicks the Add item button on our alert
            print(textfield.text)
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create new item"
            textfield = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
