//
//  TableViewController.swift
//  TODO LIST
//
//  Created by MacBook Pro on 6/28/22.
//
import Foundation
import UIKit



class TableViewController: UITableViewController {
    
    @IBAction func pushEditAction(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
    }
    
    @IBAction func pushAddAction(_ sender: Any) {
        let AlertController = UIAlertController(title: "Create new item", message: nil, preferredStyle: .alert)
        AlertController.addTextField { (textField) in
            textField.placeholder = "New item name"
        }
        
       let AlertAction = UIAlertAction(title: "Cancel", style: .default) { (alert) in
        }
        
        let AlertAction1 = UIAlertAction(title: "Create", style: .cancel) { (alert) in
            let newItem = AlertController.textFields![0].text
            addItem(nameItem: newItem!)
            self.tableView.reloadData()

        }
        
        AlertController.addAction(AlertAction)
        AlertController.addAction(AlertAction1)

        present(AlertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let currentItem = ToDoItems[indexPath.row]
        cell.textLabel?.text = (currentItem["Name"] as? String)
        
        if (currentItem["isCompleted"] as? Bool) == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeItem(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if changeState(at: indexPath.row) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        moveItem(fromIndex: fromIndexPath.row, toIndex: to.row)
        tableView.reloadData()
    }

}
