//
//  EggTimerViewController.swift
//  iOSFeaturesSection4
//
//  Created by Luis Ramirez on 5/23/17.
//  Copyright © 2017 Lucho. All rights reserved.
//

import UIKit

class EggTimerViewController: UIViewController {
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func processTimer() {
        if let number = Int(timerLabel.text!) {
            if (number > 0) {
                timerLabel.text = "\(number - 1)"
            } else {
                timer.invalidate()
                let alert = UIAlertController(title: "Alert!", message: "The Timer has FINISHED", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            timer.invalidate()
            let alert = UIAlertController(title: "Problem", message: "There was a problem with the timer.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    

    @IBAction func didSetTimer(_ sender: Any) {
        if (timeTextField.text != "") {
            timerLabel.text = timeTextField.text
        } else {
            let alert = UIAlertController(title: "Problem", message: "The text field can't be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func didPressStart(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(EggTimerViewController.processTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func didPressPause(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func didResetTimer(_ sender: Any) {
        timerLabel.text = "210"
    }

    @IBAction func didAddTime(_ sender: Any) {
        if let number = Int(timerLabel.text!) {
            timerLabel.text = "\(number + 10)"
        } else {
            let alert = UIAlertController(title: "Problem", message: "There was a problem with the timer.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func didRemoveTime(_ sender: Any) {
        if let number = Int(timerLabel.text!) {
            if (number > 10 ) {
                timerLabel.text = "\(number - 10)"
            }
        } else {
            let alert = UIAlertController(title: "Problem", message: "There was a problem with the timer.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
