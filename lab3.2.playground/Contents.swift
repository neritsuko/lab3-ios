struct Task {
    var title: String
    var description: String
    var isCompleted: Bool
}

class ToDoList {
    var tasks: [Task] = []

    func addTask(title: String, description: String) {
        let task = Task(title: title, description: description, isCompleted: false)
        tasks.append(task)
        print("Task added.")
    }

    func removeTask(title: String) {
        if let index = tasks.firstIndex(where: { $0.title == title }) {
            tasks.remove(at: index)
            print("Task removed.")
        } else {
            print("Task not found.")
        }
    }

    func updateTaskStatus(title: String, isCompleted: Bool) {
        if let index = tasks.firstIndex(where: { $0.title == title }) {
            tasks[index].isCompleted = isCompleted
            print("Task status updated")
        } else {
            print("Task not found.")
        }
    }

    func displayAllTasks() {
        for task in tasks {
            let status = task.isCompleted ? "Completed" : "Not Completed"
            print("Title: \(task.title), Description: \(task.description), Status: \(status)")
        }
    }
}

func getInput() -> String {
    if let input = readLine() {
        return input
    } else {
        return ""
    }
}

let toDoList = ToDoList()

while true {
    print("Choose an option from 1 to 4:")
    print("1. Add Task")
    print("2. Remove Task")
    print("3. Update Task Status")
    print("4. Display All Tasks")
    
    if let choice = Int(getInput()) {
        switch choice {
        case 1:
            print("Enter task title:")
            let title = getInput()
            print("Enter task description:")
            let description = getInput()
            toDoList.addTask(title: title, description: description)
        case 2:
            print("Enter task title to remove:")
            let title = getInput()
            toDoList.removeTask(title: title)
        case 3:
            print("Enter task title to change status:")
            let title = getInput()
             print("Enter new status (true/false):")
            let statusInput = getInput().lowercased()
            if statusInput == "true" || statusInput == "false" {
                toDoList.updateTaskStatus(title: title, isCompleted: statusInput == "true")
            } else {
                print("Incorrect status input!")
            }
        case 4:
            toDoList.displayAllTasks()
        default:
            print("Invalid choice!")
        }
    } else {
        print("Invalid choice!")
    }
}
