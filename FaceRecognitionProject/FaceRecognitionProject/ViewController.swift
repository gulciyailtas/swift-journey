//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Gülçiya İltaş on 2.11.2024.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        
        let authContext = LAContext()
        var error : NSError?
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is It You ?") { (success, error) in
                if success {
                    //Succesful auth
                    DispatchQueue.main.async {
//                        self.shouldPerformSegue(withIdentifier: "toSecondVC", sender: nil)
                        
                        self.myLabel.text = "Success"
                    }
                    } else {
                        DispatchQueue.main.async {
                            self.myLabel.text = "Error!"
                        }
                    }
                }
            }
        }
        
    }

