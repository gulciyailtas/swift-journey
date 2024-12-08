//
//  ViewController.swift
//  LoginExample
//
//  Created by Gülçiya İltaş on 1.12.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var mailTextField: UITextField!
    @IBOutlet var registerButtonTapped: UIButton!
    @IBOutlet var loginButtonTapped: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        view.backgroundColor = .systemBackground
    }
    
    func configureUI() {
        loginButtonTapped.layer.cornerRadius = 8
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let mail = mailTextField.text, !mail.isEmpty,
              let password = passwordTextField.text, !password.isEmpty
        else {
            print("Lütfen Tüm Alanları Doldurun!")
            return
            
        }
    }
}
