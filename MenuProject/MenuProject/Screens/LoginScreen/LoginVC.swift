//
//  LoginVC.swift
//  MenuProject
//
//  Created by Gülçiya İltaş on 31.12.2024.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var forgotPasswordButtonLabel: UILabel!
    @IBOutlet var fullNameTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareFullNameTextField()
        prepareUsernameTextField()
        prepareEmailTextField()
        preparePhoneTextField()
        preparePasswordTextField()
        prepareForgotPasswordLabel()
        prepareSignUpButton()
    }

    @IBAction func SignUpButtonClicked(_ sender: Any) {
        print("İsim Soyisim: \(fullNameTextField.text)")
        print("Kullanıcı Adı: \(usernameTextField.text)")
        print("Email Adresi: \(emailTextField.text)")
        print("Telefon Numarası: \(phoneTextField.text)")
        print("Şifresi: \(phoneTextField.text)")
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
        
        let fullNameLeftImage = UIImageView()
        fullNameLeftImage.translatesAutoresizingMaskIntoConstraints = false
        fullNameLeftImage.image = UIImage(named: "username_left_icon")
        
        imageContainer.addSubview(fullNameLeftImage)
        fullNameLeftImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 15).isActive = true
        fullNameLeftImage.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        fullNameLeftImage.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        fullNameLeftImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
        
        fullNameTextField.leftView = imageContainer
        fullNameTextField.leftViewMode = .always
    }

    private func prepareUsernameTextField() {
        usernameTextField.layer.cornerRadius = 10
        usernameTextField.clipsToBounds = true
        usernameTextField.layer.borderWidth = 1
        usernameTextField.layer.borderColor = UIColor(named: "grayText")?.withAlphaComponent(0.5).cgColor
        usernameTextField.placeholder = "Kullanıcı Adı Giriniz..."
        
        let imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.backgroundColor = .clear
        
        let usernameLeftImage = UIImageView()
        usernameLeftImage.translatesAutoresizingMaskIntoConstraints = false
        usernameLeftImage.image = UIImage(named: "username_left_icon")
        
        imageContainer.addSubview(usernameLeftImage)
        usernameLeftImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 15).isActive = true
        usernameLeftImage.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        usernameLeftImage.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        usernameLeftImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
        
        usernameTextField.leftView = imageContainer
        usernameTextField.leftViewMode = .always
    }

    private func prepareEmailTextField() {
        emailTextField.layer.cornerRadius = 10
        emailTextField.clipsToBounds = true
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor(named: "grayText")?.withAlphaComponent(0.5).cgColor
        emailTextField.placeholder = "Email Giriniz..."
        
        let imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.backgroundColor = .clear
        
        let emailLeftImage = UIImageView()
        emailLeftImage.translatesAutoresizingMaskIntoConstraints = false
        emailLeftImage.image = UIImage(named: "email_ left_icon")
        
        imageContainer.addSubview(emailLeftImage)
        emailLeftImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 15).isActive = true
        emailLeftImage.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        emailLeftImage.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        emailLeftImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
        
        emailTextField.leftView = imageContainer
        emailTextField.leftViewMode = .always
    }
    
    private func preparePhoneTextField() {
        phoneTextField.layer.cornerRadius = 10
        phoneTextField.clipsToBounds = true
        phoneTextField.layer.borderWidth = 1
        phoneTextField.layer.borderColor = UIColor(named: "grayText")?.withAlphaComponent(0.5).cgColor
        phoneTextField.placeholder = "Telefon Numarası Giriniz..."
        phoneTextField.keyboardType = .phonePad
        
        let imageContainer = UIView()
        imageContainer.translatesAutoresizingMaskIntoConstraints = false
        imageContainer.backgroundColor = .clear
        
        let phoneLeftImage = UIImageView()
        phoneLeftImage.translatesAutoresizingMaskIntoConstraints = false
        phoneLeftImage.image = UIImage(named: "phone_left_icon")
        
        imageContainer.addSubview(phoneLeftImage)
        phoneLeftImage.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor, constant: 15).isActive = true
        phoneLeftImage.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor).isActive = true
        phoneLeftImage.topAnchor.constraint(equalTo: imageContainer.topAnchor).isActive = true
        phoneLeftImage.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor).isActive = true
        
        phoneTextField.leftView = imageContainer
        phoneTextField.leftViewMode = .always
    }
    
    private func preparePasswordTextField() {
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.clipsToBounds = true
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor(named: "grayText")?.withAlphaComponent(0.5).cgColor
        passwordTextField.isSecureTextEntry = true
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
        let underLineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue]
        let underLineAttributeString = NSAttributedString(string: "Forgot Password?", attributes: underLineAttribute)
        forgotPasswordButtonLabel.attributedText = underLineAttributeString
    }
    
    private func prepareSignUpButton() {
        signUpButton.layer.cornerRadius = 10
        signUpButton.clipsToBounds = true
    }
}
