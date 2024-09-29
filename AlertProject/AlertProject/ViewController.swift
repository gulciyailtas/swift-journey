//
//  ViewController.swift
//  AlertProject
//
//  Created by Gülçiya İltaş on 25.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var UsernameText: UITextField!
    
    @IBOutlet weak var Password2Text: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignupClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Error!", message: "Username not found", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
            // button clicked
            print("button clicked")
        }
        alert.addAction(okButton)
        self.present(alert,animated: true, completion: nil)
        
        if UsernameText.text == "" {
            let alert = UIAlertController(title: "Error", message: "Username not found", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default,handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }else if PasswordText.text == "" {
            let alert = UIAlertController(title: "Error", message: "Password not found", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }else if Password2Text.text == "" {
            let alert = UIAlertController(title: "Error", message: "Passwords do not match", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        } else {
                let alert = UIAlertController(title: "Succes", message: "User OK", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            }
        }
        
    
    }
    


