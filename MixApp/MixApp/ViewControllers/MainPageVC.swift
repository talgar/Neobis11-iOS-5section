//
//  ViewController.swift
//  MixApp
//
//  Created by admin on 18.10.2020.
//

import UIKit

class MainPageVC: UIViewController {

    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        slideMenu()
//        navBar()
        // Do any additional setup after loading the view.
    }
    

    func slideMenu() {
        if revealViewController() != nil {
            
            menuBtn.target = revealViewController()
            menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController()?.rearViewRevealWidth = 275
            
            view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        }
    }
    
//    func navBar(){
//        navigationController?.navigationBar.tintColor = UIColor(red: 275/275, green: 275/275, blue: 275/275, alpha: 1)
//        navigationController?.navigationBar.barTintColor = UIColor(red: 275/275, green: 87/275, blue: 35/275, alpha: 1)
//
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
