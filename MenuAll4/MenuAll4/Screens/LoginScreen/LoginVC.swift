//
//  LoginVC.swift
//  MenuAll4
//
//  Created by Gülçiya İltaş on 25.12.2024.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var forgotPasswordButtonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        prepareEmailTextField()
        preparePasswordTextField()
        
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        print("Email Adresi: \(emailTextField.text)")
        print("Şifresi: \(passwordTextField.text)")
    }
    
    private func prepareEmailTextField() {
        emailTextField.layer.cornerRadius = 10
        emailTextField.clipsToBounds = true
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor(named: "grayText")?.withAlphaComponent(0.5).cgColor
        emailTextField.placeholder = "Email Giriniz..."
        
        let imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = true
        imageContainer.backgroundColor = .clear
        
        let emailLeftImage = UIImageView()
        emailLeftImage.translatesAutoresizingMaskIntoConstraints = true
        emailLeftImage.image = UIImage(named: "email_left_icon")
        
        imageContainer.addSubview(emailLeftImage)
        emailLeftImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 15).isActive = false
        emailLeftImage.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = false
        emailLeftImage.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = false
        emailLeftImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = false
        
        emailTextField.leftView = imageContainer
        emailTextField.leftViewMode = .always
        
        
    }
    
    private func preparePasswordTextField() {
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor(named: "grayText")?.withAlphaComponent(0.5).cgColor
        passwordTextField.placeholder = "Email Giriniz..."
        
        let imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = true
        imageContainer.backgroundColor = .clear
        
        let passwordLeftImage = UIImageView()
        passwordLeftImage.translatesAutoresizingMaskIntoConstraints = true
        passwordLeftImage.image = UIImage(named: "password_left_icon")
        
        imageContainer.addSubview(passwordLeftImage)
        passwordLeftImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 15).isActive = false
        passwordLeftImage.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = false
        passwordLeftImage.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = false
        passwordLeftImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = false
        
        passwordTextField.leftView = imageContainer
        passwordTextField.leftViewMode = .always
    }
    private func prepareForgotPasswordLabel() {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Forgot password?", attributes: underlineAttribute)
        forgotPasswordButtonLabel.attributedText = underlineAttributedString
    }
}
