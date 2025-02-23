//
//  RegisterVC.swift
//  MenuLast
//
//  Created by Gülçiya İltaş on 4.01.2025.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButtonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareFullNameTextField()
        
    }
    
    @IBAction func signUpButtonClicked(_ sender: Any) {
    }
    
    private func prepareFullNameTextField() {
        fullNameTextField.layer.cornerRadius = 10
        fullNameTextField.clipsToBounds = true
        fullNameTextField.layer.borderWidth = 1
        fullNameTextField.layer.borderColor = UIColor(named: "grayText")?.withAlphaComponent(0.5).cgColor
        fullNameTextField.placeholder = "İsim Soyisim Giriniz..."
        
        let imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.backgroundColor = .clear
        
        let fullNameLeftİmage = UIImageView()
        fullNameLeftİmage.translatesAutoresizingMaskIntoConstraints = false
        fullNameLeftİmage.image = UIImage(named: "full_name_left_icon")
        
        imageContainer.addSubview(fullNameLeftİmage)
        fullNameLeftİmage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 15).isActive = true
        fullNameLeftİmage.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        fullNameLeftİmage.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        fullNameLeftİmage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
        
        fullNameTextField.leftView = imageContainer
        fullNameTextField.leftViewMode = .always
        
        
    }
}
