//
//  LoginVC.swift
//  MenuAll3
//
//  Created by Gülçiya İltaş on 22.12.2024.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var forgetPasswordButtonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareEmailTextField()
        preparePasswordTextField()
        prepareForgotPasswordLabel()
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        print("Email Adresi: \(emailTextField.text)")
        print("Şifresi: \(passwordTextField.text)")
        navigationController?.pushViewController(HomePageVC(), animated: true)
    }
    
    private func prepareEmailTextField() {
        emailTextField.layer.cornerRadius = 10
        emailTextField.clipsToBounds = true
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor(named: "GrayText")?.withAlphaComponent(0.5).cgColor
        emailTextField.placeholder = "Email Giriniz..."
        
        let imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.backgroundColor = .clear
        
        let emailLeftImage = UIImageView()
        emailLeftImage.translatesAutoresizingMaskIntoConstraints = false
        emailLeftImage.image = UIImage(named: "email_left_icon")
        
        imageContainer.addSubview(emailLeftImage)
        emailLeftImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 15).isActive = true
        emailLeftImage.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        emailLeftImage.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        emailLeftImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
        
        emailTextField.leftView = imageContainer
        emailTextField.leftViewMode = .always
    }
    
    private func preparePasswordTextField() {
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor(named: "GrayText")?.withAlphaComponent(0.5).cgColor
        passwordTextField.placeholder = "Şifre Giriniz..."
        
        let imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.backgroundColor = .clear
        
        let passwordLeftImage = UIImageView()
        passwordLeftImage.translatesAutoresizingMaskIntoConstraints = false
        passwordLeftImage.image = UIImage(named: "password_left_icon")
        
        imageContainer.addSubview(passwordLeftImage)
        passwordLeftImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 15).isActive = true
        passwordLeftImage.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        passwordLeftImage.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        passwordLeftImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
        
        passwordTextField.leftView = imageContainer
        passwordTextField.leftViewMode = .always
    }
    
    private func prepareForgotPasswordLabel() {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underlineAttributedString = NSAttributedString(string: "Forgot password?", attributes: underlineAttribute)
        forgetPasswordButtonLabel.attributedText = underlineAttributedString
    }
}
