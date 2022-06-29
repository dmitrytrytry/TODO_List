//
//  Model.swift
//  TODO LIST
//
//  Created by MacBook Pro on 6/28/22.
//

import Foundation

var ToDoItems: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
}


func addItem(nameItem: String, isCompeted: Bool = false) {
    ToDoItems.append(["Name": nameItem, "isCompleted": false])
}

func removeItem(at index: Int) {
    ToDoItems.remove(at: index)
}

func changeState(at item: Int) -> Bool {
    ToDoItems[item]["isCompleted"] = !(ToDoItems[item]["isCompleted"] as! Bool)
    return (ToDoItems[item]["isCompleted"] != nil)
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = ToDoItems[fromIndex]
    ToDoItems.remove(at: fromIndex)
    ToDoItems.insert(from, at: toIndex)
}
