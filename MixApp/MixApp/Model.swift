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

func addItem(nameItem : String, isCompleted : Bool = false)  {
    toDoItems.append(["Name": nameItem, "isCompleted": isCompleted])
    setBadge()
}

func removeItem(at Index : Int) {
    toDoItems.remove(at: Index)
    setBadge()
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = toDoItems[fromIndex]
    toDoItems.remove(at: fromIndex)
    toDoItems.insert(from, at: toIndex)
}
func changeState(at item: Int) -> Bool {
    toDoItems[item]["isCompleted"] = !(toDoItems[item]["isCompleted"] as! Bool)
    setBadge()
    return toDoItems[item]["isCompleted"] as! Bool
}

func requestForNotificstion( ) {
    UNUserNotificationCenter.current().requestAuthorization(options: .badge) { (isEnabled, error) in
    }
}

func setBadge( ) {
    
    var totalBadgeNumber = 0
    for i in toDoItems {
        if (i["isCompleted"] as? Bool) == false {
            totalBadgeNumber += 1
        }
    }
    
    UIApplication.shared.applicationIconBadgeNumber = totalBadgeNumber
}

extension Int {
    func timeString() -> String {
        let hours = Int(self) / 3600
        let minute = Int(self) / 60 % 60
        let seconds = Int(self) % 60
        
        return String(format:"%02i:%02i:%02i", hours,minute,seconds)
    }
    
}
