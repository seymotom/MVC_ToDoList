//
//  TableViewDataSource.swift
//  MCVtoDoList
//
//  Created by Tom Seymour on 3/26/17.
//  Copyright © 2017 C4Q-3.2. All rights reserved.
//

import UIKit

class TableViewDataSource: NSObject {
    let stateController: StateController
    
    init(tableView: UITableView, stateController: StateController) {
        self.stateController = stateController
        super.init()
        tableView.dataSource = self
    }
}

extension TableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return stateController.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // We retrieve the item from the array, deque a cell
        // for it and configure it, before returning it to
        // the table view.
        let toDoItem = stateController.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ToDoItemCell.identifier, for: indexPath) as! ToDoItemCell
        cell.name = toDoItem.name
        cell.completed = toDoItem.completed
        return cell
    }
}
