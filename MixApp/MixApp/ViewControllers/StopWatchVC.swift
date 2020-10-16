//
//  ViewController.swift
//  StopWatch Application
//
//  Created by admin on 24.09.2020.
//  Copyright © 2020 Talgar. All rights reserved.
//

import UIKit

class StopWatchVC: UIViewController {

    @IBOutlet weak var labelSW: UILabel!
    @IBOutlet weak var playPauseBtnSW: UIButton!
    
    var seconds = 0
    var timer = Timer()
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playPauseActSW(_ sender: Any) {
    
        if isTimerRunning == false {
            runTimeSW()
            playPauseBtnSW.setImage(UIImage(named:"pause"),for:UIControl.State.normal)
        } else {
            isTimerRunning = false
            timer.invalidate()
            playPauseBtnSW.setImage(UIImage(named:"play"),for:UIControl.State.normal)
        }
    }
    
    func runTimeSW() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(startSW)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }

    @objc func startSW() {
        seconds += 1
        labelSW.text = seconds.timeString()
    }

    @IBAction func resetActSW(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        playPauseBtnSW.setImage(UIImage(named: "play"), for: .normal)
        seconds = 0
        labelSW.text = seconds.timeString()
    }
}


