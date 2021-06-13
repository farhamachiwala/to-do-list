//
//  AddTaskController.swift
//  ToDoList
//
//  Created by Farha Machiwala on 13/06/21.
//

import UIKit

protocol AddTask {
    func addTask(taskName: String)
}

class AddTaskController: UIViewController {

    @IBAction func addButtonAction(_ sender: Any) {
        if taskNameOutlet.text != "" {
            delegate?.addTask(taskName: taskNameOutlet.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    @IBOutlet weak var taskNameOutlet: UITextField!
    
    var delegate: AddTask?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationCenter = NotificationCenter.default
            notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
            notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
    }
    
    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return }
        
        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }
        
        scrollView.scrollIndicatorInsets = scrollView.contentInset
    }
}


