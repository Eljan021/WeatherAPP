//
//  RegisterViewController.swift
//  WeatherAPP
//
//  Created by Eljan on 24.04.24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var surnameNameLabel: UILabel!
    @IBOutlet private weak var surnameNameTextField: UITextField!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var backToLoginButton: UIButton!
    
    
    @IBAction func backToLoginClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.delegate = self
        surnameNameTextField.delegate = self
        
        
    }
    
}


extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField {
        case emailTextField:
            if (emailTextField.text?.count ?? 0) > 3 {
                emailTextField.layer.borderWidth = 0
            }else{
                emailTextField.layer.borderWidth = 1
                emailTextField.layer.borderColor = UIColor.red.cgColor
            }
        case passwordTextField:
            if (passwordTextField.text?.count ?? 0) > 3 {passwordTextField.layer.borderWidth = 0 } else {
                passwordTextField.isSecureTextEntry = true
                passwordTextField.layer.borderWidth = 1
                passwordTextField.layer.borderColor = UIColor.red.cgColor
            }
        case userNameTextField:
            if (userNameTextField.text?.count ?? 0) > 3 {userNameTextField.layer.borderWidth = 0} else {
                userNameTextField.layer.borderWidth = 1
                userNameLabel.layer.borderColor = UIColor.red.cgColor
                
            }
        case surnameNameTextField:
            if (surnameNameTextField.text?.count ?? 0) > 3 {surnameNameTextField.layer.borderWidth = 0} else {
                surnameNameTextField.layer.borderWidth = 1
                surnameNameTextField.layer.borderColor = UIColor.red.cgColor
            }
            
            
        default:
            break
        }
    }
}


