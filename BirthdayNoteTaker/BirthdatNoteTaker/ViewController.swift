//
//  ViewController.swift
//  BirthdatNoteTaker
//
//  Created by Gülçiya İltaş on 18.08.2024.
//

import UIKit

class ViewController: UIViewController {

@IBOutlet weak var nameTextField: UITextField!
@IBOutlet weak var birthdayTextField: UITextField!
@IBOutlet weak var nameLabel: UILabel!

@IBOutlet weak var birthdayLabel: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        // Casting - as? vs. as! force casting
        // Any
        
        if let newName = storedName as? String {
            nameLabel.text = newName
        }
        if let newBirthday = storedBirthday as? String  {
            birthdayLabel.text = newBirthday
        }
    }

    @IBAction func saveClicked(_ sender: Any) {
        
        UserDefaults.standard.setValue(nameTextField.text!, forKey: "name")
        UserDefaults.standard.setValue(birthdayTextField.text!, forKey: "birthday")
        //UserDefaults.standard.synchronize()
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
    }
    
    @IBAction func deleteClicked(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday =  UserDefaults.standard.object(forKey: "birthday")
        
        // "" vs nill
        
        
        if ( storedName as? String ) != nil {
            
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name: "
        }
        
        if (( storedBirthday as? String) != nil)  {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday"
        }
    }
    

}

