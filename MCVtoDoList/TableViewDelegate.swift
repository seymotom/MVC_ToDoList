//
//  TableViewDelegate.swift
//  MCVtoDoList
//
//  Created by Tom Seymour on 3/26/17.
//  Copyright © 2017 C4Q-3.2. All rights reserved.
//

import UIKit

class TableViewDelegate: NSObject {
    let stateController: StateController
    
    init(tableView: UITableView, stateController: StateController) {
        self.stateController = stateController
        super.init()
        tableView.delegate = self
    }
}

extension TableViewDelegate: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // When a cell is selected, we remove its highlight, retrieve the corresponding to-do item and change its completion.
        tableView.deselectRow(at: indexPath, animated: false)
        let tappedItem = stateController.items[indexPath.row]
        tappedItem.completed = !tappedItem.completed
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
    }
    
}
