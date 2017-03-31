//
//  ToDoItemCell.swift
//  MCVtoDoList
//
//  Created by Tom Seymour on 3/26/17.
//  Copyright © 2017 C4Q-3.2. All rights reserved.
//

import UIKit

class ToDoItemCell: UITableViewCell {
    static let identifier = "ToDoItemCell"
    
    var name: String? {
        didSet {
            textLabel?.text = name
        }
    }
    
    var completed: Bool = false {
        didSet {
            if (completed) {
                accessoryType = UITableViewCellAccessoryType.checkmark
            } else {
                accessoryType = UITableViewCellAccessoryType.none
            }
        }
    }
}
