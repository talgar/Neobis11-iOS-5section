//
//  Model.swift
//  ListOfPlan
//
//  Created by admin on 20.06.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit


struct Constants {
    private init(){}
    static let myStoryboardID = "Main"
    static let mainPageID = "MainPage"
}

class Items {
    var toDoItems: [[String: Any]] {
        set {
            UserDefaults.standard.set(newValue, forKey: "toDoDataKey")
            UserDefaults.standard.synchronize()
        }
        get {
            if let array = UserDefaults.standard.array(forKey: "toDoDataKey") as? [[String: Any]]  {
                return array
            } else {
                return []
            }
        }
    }
}

var toDo = Items()
func addItem(nameItem : String, isCompleted : Bool = false)  {
    toDo.toDoItems.append(["Name": nameItem, "isCompleted": isCompleted])
   
}

func removeItem(at Index : Int) {
    toDo.toDoItems.remove(at: Index)
    
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = toDo.toDoItems[fromIndex]
    toDo.toDoItems.remove(at: fromIndex)
    toDo.toDoItems.insert(from, at: toIndex)
}
func changeState(at item: Int) -> Bool {
    toDo.toDoItems[item]["isCompleted"] = !(toDo.toDoItems[item]["isCompleted"] as! Bool)
    return toDo.toDoItems[item]["isCompleted"] as! Bool
    
}

extension Int {
    func timeString() -> String {
        let hours = Int(self) / 3600
        let minute = Int(self) / 60 % 60
        let seconds = Int(self) % 60
        
        return String(format:"%02i:%02i:%02i", hours,minute,seconds)
    }
    
}



