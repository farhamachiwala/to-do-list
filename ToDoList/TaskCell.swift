//
//  TaskCell.swift
//  ToDoList
//
//  Created by Farha Machiwala on 13/06/21.
//

import UIKit

protocol ChangeButton {
    func changeButton(checked: Bool, index: Int)
}

class TaskCell: UITableViewCell {

    @IBAction func checkboxAction(_ sender: Any) {
        if allTasks![indexP!].checked {
            delegate?.changeButton(checked: false, index: indexP!)
        }
        else {
            delegate?.changeButton(checked: true, index: indexP!)
        }
    }
    
    @IBOutlet weak var checkboxOutlet: UIButton!
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    var delegate: ChangeButton?
    var indexP: Int?
    var allTasks: [Task]?

}
