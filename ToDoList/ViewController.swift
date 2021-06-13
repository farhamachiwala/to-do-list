//
//  ViewController.swift
//  ToDoList
//
//  Created by Farha Machiwala on 13/06/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, ChangeButton {
    
    var allTasks: [Task] = []
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.taskNameLabel.text = allTasks[indexPath.row].taskName
        
        if allTasks[indexPath.row].checked {
            cell.checkboxOutlet.setBackgroundImage(UIImage(named: "checkBoxFilled"), for: .normal)
        }
        else {
            cell.checkboxOutlet.setBackgroundImage(UIImage(named: "checkBoxOutline"), for: .normal)
        }
        
        cell.delegate = self
        cell.indexP = indexPath.row
        cell.allTasks = allTasks
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! AddTaskController
        viewController.delegate = self
    }

    func addTask(taskName: String) {
        allTasks.append(Task(taskName: taskName))
        tableViewOutlet.reloadData()
    }

    func changeButton(checked: Bool, index: Int) {
        allTasks[index].checked = checked
        tableViewOutlet.reloadData()
    }
}

class Task {
    var taskName = ""
    var checked = false
    
    init(taskName: String) {
        self.taskName = taskName
    }
}
