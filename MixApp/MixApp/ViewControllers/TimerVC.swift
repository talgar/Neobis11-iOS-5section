//
//  BackViewController.swift
//  StopWatch Application
//
//  Created by admin on 11.10.2020.
//  Copyright © 2020 Talgar. All rights reserved.
//

import UIKit

class TimerVC: UIViewController {

    @IBOutlet weak var sliderTimeT: UISlider!
    @IBOutlet weak var playPauseBtnT: UIButton!
    @IBOutlet weak var labelT: UILabel!
    
    var isTimerRunning = false
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playPauseActT(_ sender: Any) {
        
        if  isTimerRunning == false {
            runTimeT()
            playPauseBtnT.setImage(UIImage(named: "pause"), for: UIControl.State.normal)
        } else {
            isTimerRunning = false
            timer.invalidate()
            playPauseBtnT.setImage(UIImage(named: "play"), for: UIControl.State.normal)
        }
    }
    
    @objc func startT() {
        if sliderTimeT.value < 1 {
            timer.invalidate()
            playPauseBtnT.setImage(UIImage(named: "play"), for: .normal)
        } else {
            sliderTimeT.value -= 1
            labelT.text = Int(sliderTimeT.value).timeString()
        }
    }
    
    func runTimeT() {timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(startT)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    @IBAction func resetActT(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        playPauseBtnT.setImage(UIImage(named: "play"), for: UIControl.State.normal)
        sliderTimeT.value = 0
        labelT.text = Int(sliderTimeT.value).timeString()
        sliderTimeT.setValue(0, animated: true)
    }
    
    @IBAction func sliderTimeActT(_ sender: UISlider) {
        labelT.text =  Int(sender.value).timeString()
    }
}
