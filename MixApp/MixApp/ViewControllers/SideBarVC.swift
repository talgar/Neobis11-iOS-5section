//
//  ViewController.swift
//  MixApp
//
//  Created by admin on 17.10.2020.
//


import UIKit

class SideBarVC: UIViewController {
    
    @IBOutlet weak var Trailing: NSLayoutConstraint!
    @IBOutlet weak var Leading: NSLayoutConstraint!
    
    var menuOut = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    @IBAction func didTapMenu(_ sender: Any) {
        
        if menuOut == false {
            Leading.constant = 250
            Trailing.constant = -250
            menuOut = true
        } else {
            Leading.constant = 0
            Trailing.constant = 0
            menuOut = false
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func TodoListTap(_ sender: Any) {
        
        let TodoListStb = UIStoryboard(name:Constants.myStoryboardID, bundle: nil)
        
        let ToDoLVC = TodoListStb.instantiateViewController(identifier: Constants.ToDoListID)
        navigationController?.pushViewController(ToDoLVC, animated: true)
    }
    
    @IBAction func StopWatchTap(_ sender: Any) {
        
        let StopWStb = UIStoryboard(name:Constants.myStoryboardID, bundle: nil)
        
        let StopWVC = StopWStb.instantiateViewController(identifier:Constants.StopWatchID)
        navigationController?.pushViewController(StopWVC, animated: true)
    }
}
