//
//  AddToDoItemViewController.swift
//  MCVtoDoList
//
//  Created by Tom Seymour on 3/26/17.
//  Copyright © 2017 C4Q-3.2. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {
    
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var nameTextField: UITextField!

    var stateController: StateController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the cancel button is tapped or no name for the item has been typed in the text field, we do nothing. Otherwise, we create a new to-do item and add it to the state controller.
        guard
            let tappedButton = sender as? UIBarButtonItem, tappedButton != cancelButton,
            let text = nameTextField.text
        else { return }
        
        let todoItem = ToDoItem(name: text, completed: false, creationDate: NSDate())
        stateController?.addItem(item: todoItem)
    }
}

    

