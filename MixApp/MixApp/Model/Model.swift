//
//  Model.swift
//  ListOfPlan
//
//  Created by admin on 20.06.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit

class Items : Codable {
    let name : String?
    var completed : Bool?
    
    init(name : String,completed : Bool) {
        self.name = name
        self.completed = completed
    }
}

var toDoItems = [Items]()


func addItem(nameItem : String, isCompleted : Bool = false)  {
    toDoItems.append(Items(name: nameItem, completed: isCompleted))
    saveData()
}

func removeItem(at Index : Int) {
    toDoItems.remove(at: Index)
    saveData()
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = toDoItems[fromIndex]
    toDoItems.remove(at: fromIndex)
    toDoItems.insert(from, at: toIndex)
    saveData()
}

func changeState(at item: Int) -> Bool {
    toDoItems[item].completed = !(toDoItems[item].completed!)
    saveData()
    return toDoItems[item].completed!
}

func saveData() {
    UserDefaults.standard.set(try? PropertyListEncoder().encode(toDoItems), forKey: "toDo")
}

func loadData() {
    if let data = UserDefaults.standard.value(forKey: "toDo") as? Data {
        let item = try? PropertyListDecoder().decode(Array<Items>.self, from: data)
        toDoItems = item!
    }
}

//MARK: - StopWatch TimeLabel
extension Int {
    func timeString() -> String {
        let hours = Int(self) / 3600
        let minute = Int(self) / 60 % 60
        let seconds = Int(self) % 60
        
        return String(format:"%02i:%02i:%02i", hours,minute,seconds)
    }
}

