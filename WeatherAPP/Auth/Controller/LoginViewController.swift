//
//  LoginViewController.swift
//  WeatherAPP
//
//  Created by Eljan on 24.04.24.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signUpbutton: UIButton!
    @IBOutlet private weak var loginbutton: UIButton!
    
    @IBAction func signUp(_ sender: Any) {
        let vc = UIStoryboard(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func loginclicked(_ sender: Any) {
        isemptyCheck()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    
    fileprivate func configureView(){
        signUpbutton.layer.borderColor = UIColor.systemIndigo.cgColor
        signUpbutton.layer.borderWidth = 1.0
        loginbutton.layer.cornerRadius = 12
        signUpbutton.layer.cornerRadius = 12
        userNameTextField.layer.borderWidth = 1.0
        userNameTextField.layer.borderColor = UIColor.systemIndigo.cgColor
        userNameTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.systemIndigo.cgColor
        passwordTextField.layer.cornerRadius = 8
    }
    
    
    fileprivate func isemptyCheck(){
        
        if userNameTextField.text?.isEmpty ?? false || passwordTextField.text?.isEmpty ?? false {
            let alertController = UIAlertController(
                title: "Error",
                message: "Not logged in",
                preferredStyle: .alert)
            
            alertController.addAction(
                UIAlertAction(
                    title: "Close",
                    style: .cancel))
            present(alertController,animated: true)
       
        }
    }
   
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField {
            
            
        case passwordTextField:
            if (passwordTextField.text?.count ?? 0) > 5 {passwordTextField.layer.borderWidth = 0 } else {
                passwordTextField.isSecureTextEntry = true
                passwordTextField.layer.borderWidth = 1
                passwordTextField.layer.borderColor = UIColor.red.cgColor
            }
        case userNameTextField:
            if (userNameTextField.text?.count ?? 0) > 4 {userNameTextField.layer.borderWidth = 0} else {
                userNameTextField.layer.borderWidth = 1
                userNameTextField.layer.borderColor = UIColor.red.cgColor
                
            }

        default:
            break
        }
    }
    
}
