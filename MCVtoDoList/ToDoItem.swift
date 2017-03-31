//
//  ToDoItem.swift
//  MCVtoDoList
//
//  Created by Tom Seymour on 3/26/17.
//  Copyright © 2017 C4Q-3.2. All rights reserved.
//

import Foundation

class ToDoItem: NSObject, NSCoding {
    let name: String
    let creationDate: NSDate
    var completed: Bool
    
    init(name: String, completed: Bool, creationDate: NSDate) {
        self.name = name
        self.completed = completed
        self.creationDate = creationDate
    }
    
    required init?(coder aDecoder: NSCoder) {
        // Taking the values to initialize properties from the NSCoder instance
        name = aDecoder.decodeObject(forKey: Keys.name.rawValue) as! String
        completed = aDecoder.decodeObject(forKey: Keys.completed.rawValue) as! Int == 1 ? true : false
        creationDate = aDecoder.decodeObject(forKey: Keys.creationDate.rawValue) as! NSDate
    }
    
    func encode(with aCoder: NSCoder) {
        // Encoding of properties through NSCoder
        aCoder.encode(name, forKey: Keys.name.rawValue)
        // Cannot save bool in NSCoder so using NSNumber to represent true and false
        aCoder.encode((completed ? 1 : 0) as NSNumber, forKey: Keys.completed.rawValue)
        aCoder.encode(creationDate, forKey: Keys.creationDate.rawValue)
    }
    
    enum Keys: String {
        // These are the names of the properties for encoding and decoding. We keep them in an enum to better organize them and avoid typos.
        case name = "name"
        case completed = "completed"
        case creationDate = "creationDate"
    }
}
