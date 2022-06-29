//
//  Model.swift
//  TODO_LIST
//
//  Created by MacBook Pro on 6/28/22.
//

import Foundation

var toDoItems: [[String: Any]] {
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    
}

func addItem(nameItem: String, isCompeted: Bool = false) {
    toDoItems.append(["Name": nameItem, "isCompleted": false])
}

func removeItem(at index: Int) {
    toDoItems.remove(at: index)
}

func changeState(at item: Int) -> Bool {
    toDoItems[item]["isCompleted"] = !(toDoItems[item]["isCompleted"] as? Bool ?? false)
    return (toDoItems[item]["isCompleted"] != nil)
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = toDoItems[fromIndex]
    toDoItems.remove(at: fromIndex)
    toDoItems.insert(from, at: toIndex)
}
