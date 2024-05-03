//
//  LoginViewController.swift
//  WeatherAPP
//
//  Created by Eljan on 24.04.24.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signUpbutton: UIButton!
    @IBOutlet private weak var loginbutton: UIButton!
    
    @IBAction func signUp(_ sender: Any) {
        signupclick()
    }
    
    @IBAction func loginclicked(_ sender: Any) {
        isemptyCheck()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    fileprivate func signupclick(){
        let vc = UIStoryboard(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardWillShow(notification:NSNotification){
        
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 80
        self.scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    fileprivate func configureView(){
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
        }else{
            let alertController = UIAlertController(
                title: "Approved",
                message: "Logged In",
                preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .default))
            present(alertController, animated: true)
            
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
    
}
