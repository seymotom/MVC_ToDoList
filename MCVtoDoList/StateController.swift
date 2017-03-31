//
//  StateController.swift
//  MCVtoDoList
//
//  Created by Tom Seymour on 3/26/17.
//  Copyright © 2017 C4Q-3.2. All rights reserved.
//

import Foundation

class StateController {
    // The path to the item's file in the documents directory
    static let itemsFilePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/items.txt"
    
    private(set) var items: [ToDoItem] = {
        // If a list has been saved, we read it from the file, otherwise we return an empty array.
        if let items = NSKeyedUnarchiver.unarchiveObject(withFile: itemsFilePath) as? [ToDoItem] {
            return items
        } else {
            return [ToDoItem]()
        }
    }()
    
    func addItem(item: ToDoItem) {
        items.append(item)
    }
    
    func save() {
        NSKeyedArchiver.archiveRootObject(self.items, toFile: StateController.itemsFilePath)
    }
}
