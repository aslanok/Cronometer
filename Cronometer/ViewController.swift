//
//  ViewController.swift
//  Cronometer
//
//  Created by MacBook on 22.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timer = Timer()
    var counter : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func sayacClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSayac", sender: nil)
    }
    @IBAction func startClicked(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(upTime), userInfo: nil, repeats: true)
        startButton.isEnabled = false
    }
    
   @objc func upTime(){
        counter += 1
       timeLabel.text = String(counter)
    }
    
    @IBAction func pauseClicked(_ sender: UIButton) {
        timer.invalidate()
        startButton.isEnabled = true
    }
    
    
    @IBAction func resetClicked(_ sender: UIButton) {
        timer.invalidate()
        counter = 0
        timeLabel.text = String(counter)
        startButton.isEnabled = true
    }
    
    
}

