//
//  ViewController.swift
//  SegueApp
//
//  Created by Gülçiya İltaş on 25.08.2024.
//

import UIKit

class ViewController: UIViewController {

    var userName = ""
    
    @IBOutlet weak var myLabel: UILabel!
   @IBOutlet weak var nameText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     print("viewDidload function called")
        }

    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear function called")
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear function called")
    }
   
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear function called")
        nameText.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear function called")
    }
    
    @IBAction func nextClicked(_ sender: Any) {
      
       userName = nameText.text!
        
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            
            // as -- casting
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.myName = userName
        }
        
    }
    
}

