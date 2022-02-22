//
//  SeconViewController.swift
//  Cronometer
//
//  Created by MacBook on 22.02.2022.
//

import UIKit

class SeconViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    var counterString : String = ""
    var timer = Timer()
    var counter: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self

    }
    
    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func pauseClicked(_ sender: UIButton) {
        timer.invalidate()
        counter = Int(countLabel.text!) ?? 3
        startButton.isEnabled = true
    }
    
    
    @IBAction func secondsTextField(_ sender: UITextField) {
        countLabel.text = textField.text
    }
    
    
    
    @IBAction func resetClicked(_ sender: UIButton) {
        timer.invalidate()
        counter = Int(textField.text!) ?? 2
        countLabel.text = String(counter)
        startButton.isEnabled = true
    }
    
    @IBAction func startClicked(_ sender: UIButton) {
        counterString = countLabel.text!
        counter = Int(counterString) ?? 50
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(downTime), userInfo: nil, repeats: true)
        startButton.isEnabled = false
    }
    
    @objc func downTime(){
        if counter == 0{
            print("it is done")
            timer.invalidate()
            startButton.isEnabled = true
        } else {
            counter = counter - 1
            countLabel.text = String(counter)
        }
        
    }
    
}
