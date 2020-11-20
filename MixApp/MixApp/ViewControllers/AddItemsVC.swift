//
//  AddItemsVC.swift
//  MixApp
//
//  Created by admin on 01.11.2020.
//

import UIKit

class AddItemsVC: UIViewController {

    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var newItemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newItemTextField.becomeFirstResponder()
    }
    
    @IBAction func addItemBtn(_ sender: Any) {
        
        let newName = newItemTextField.text
        
        if newName != "" {
            addItem(nameItem: newName!)
        }
    }
}

