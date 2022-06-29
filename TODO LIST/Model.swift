import Foundation

struct ToDo {
    var name: String
    var completed: Bool
}

var toDoItems: [ToDo] = []

func addItem(todo: ToDo) {
    toDoItems.append(todo)
}

func removeItem(at index: Int) {
    toDoItems.remove(at: index)
}

func changeState(at index: Int) -> Bool {
    toDoItems[index].completed = !toDoItems[index].completed
    return toDoItems[index].completed
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = toDoItems[fromIndex]
    toDoItems.remove(at: fromIndex)
    toDoItems.insert(from, at: toIndex)
}
