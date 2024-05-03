//
//  RegisterViewController.swift
//  WeatherAPP
//
//  Created by Eljan on 24.04.24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userNameTextField: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var surnameNameLabel: UILabel!
    @IBOutlet private weak var surnameNameTextField: UITextField!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var signInbutton: UIButton!
    @IBOutlet private weak var backbutton: UIButton!
    
    @IBAction func backClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        isemptyCheck()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.delegate = self
        surnameNameTextField.delegate = self
        configureView()
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
        signInbutton.layer.borderColor = UIColor.systemIndigo.cgColor
        signInbutton.layer.borderWidth = 1.0
        signInbutton.layer.cornerRadius = 12
        userNameTextField.layer.borderWidth = 1.0
        userNameTextField.layer.borderColor = UIColor.systemIndigo.cgColor
        userNameTextField.layer.cornerRadius = 8
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.systemIndigo.cgColor
        passwordTextField.layer.cornerRadius = 8
        
    }
    
    
    fileprivate func isemptyCheck(){
        
        if userNameTextField.text?.isEmpty ?? false || passwordTextField.text?.isEmpty ?? false
        || surnameNameTextField.text?.isEmpty ?? false || emailTextField.text?.isEmpty ?? false {
            let alertController = UIAlertController(
                title: "Error",
                message: "Account could not be created",
                preferredStyle: .alert)
            
            alertController.addAction(
                UIAlertAction(
                    title: "Close",
                    style: .cancel))
            present(alertController,animated: true)
        }else{
            let alertController = UIAlertController(
                title: "",
                message: "Account created",
                preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {ac in
                self.navigationController?.popViewController(animated: true)}))
            present(alertController, animated: true, completion: nil)
        }
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
                userNameTextField.layer.borderColor = UIColor.red.cgColor
                
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return false
    }
}


