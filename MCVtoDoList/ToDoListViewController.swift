//
//  ToDoListViewController.swift
//  MCVtoDoList
//
//  Created by Tom Seymour on 3/26/17.
//  Copyright © 2017 C4Q-3.2. All rights reserved.
//

import UIKit

class ToDoListViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    
    var stateController: StateController?
    var tableViewDataSource: TableViewDataSource?
    var tableViewDelegate: TableViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create delegate and data source instances
        if let stateController = stateController {
            tableViewDataSource = TableViewDataSource(tableView: toDoTableView, stateController: stateController)
            tableViewDelegate = TableViewDelegate(tableView: toDoTableView, stateController: stateController)
        }
        toDoTableView.register(ToDoItemCell.self, forCellReuseIdentifier: ToDoItemCell.identifier)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the state controller forward to the next view controller.
        if let navigationController = segue.destination as? UINavigationController,
            let addToDoItemViewController = navigationController.viewControllers.first as? AddToDoItemViewController {
            addToDoItemViewController.stateController = stateController
        }
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        toDoTableView.reloadData()
    }
}
