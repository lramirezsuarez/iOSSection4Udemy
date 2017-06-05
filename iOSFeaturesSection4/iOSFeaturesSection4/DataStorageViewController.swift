//
//  DataStorageViewController.swift
//  iOSFeaturesSection4
//
//  Created by Luis Ramirez on 6/5/17.
//  Copyright © 2017 Lucho. All rights reserved.
//

import UIKit

class DataStorageViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var savedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let number = UserDefaults.standard.object(forKey: "number") as? Int else {
            savedLabel.text = "There's no saved number"
            return
        }
        savedLabel.text = "\(number)"
    }

    @IBAction func didSaveNumber(_ sender: Any) {
        if (numberTextField.text != "") {
            guard let number = Int(numberTextField.text!) else {
                savedLabel.text = "Invalid value for number"
                return
            }
            UserDefaults.standard.set(number, forKey: "number")
            savedLabel.text = "\(number)"
        } else {
            let alert = UIAlertController(title: "Problem", message: "Invalid data.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
