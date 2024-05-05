//
//  LoginViewController.swift
//  WeatherAPP
//
//  Created by Eljan on 24.04.24.
//

import UIKit
import RealmSwift

class LoginViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
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
//        userCheck()
        checkUser()
        
    }
    let realm = RealmHelper.instance.realm
    private var userList: Results<User>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    fileprivate func signupclick(){
        let vc = UIStoryboard(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        
        navigationController?.pushViewController(vc!, animated: true)
    }
    fileprivate func getUserList(){
        let results = realm?.objects(User.self)
        userList = results
        
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
    
    fileprivate func checkUser(){
        let realm = try! Realm()
        
        let inputEmail = userNameTextField.text ?? ""
        let inputPassword = passwordTextField.text ?? ""
        
        let users = realm.objects(User.self)
        print(users)
        
        guard let user = users.first(where: {$0.username == inputEmail}) else {
            print("notfound")
            let alert = UIAlertController(title: "User not found", message: "Pleace re-enter info or register", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Go to register", style:UIAlertAction.Style.default , handler: { ac in
                let vc = UIStoryboard(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier:"RegisterViewController") as? RegisterViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            }))
                            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if user.password == inputPassword {
            print("access granted")
//            let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TabbarViewController") as? TabbarViewController
//                                navigationController?.pushViewController(vc!, animated: true)
        } else {
            print("access denied")
            let alert = UIAlertController(title: "Password error",
                                          message: "Pleace check password",
                                          preferredStyle: UIAlertController.Style.alert)
                                alert.addAction(UIAlertAction(title: "Click",
                                                              style: UIAlertAction.Style.cancel,
                                                              handler: nil))
            
                                self.present(alert, animated: true, completion: nil)
        }
    }
}
    
    
    
//    
//    fileprivate func userCheck(){
//        let realm = try! Realm()
//        
//        let inputUsername = userNameTextField.text ?? ""
//        let inputPassword = passwordTextField.text ?? ""
//        
//        let users = realm.objects(User.self)
//        
//        guard let user = users.first(where: {$0.username == inputUsername}) else {
//            print("notfound")
//            if userNameTextField.text?.isEmpty ?? false{
//                let alertController = UIAlertController(
//                    title: "Error",
//                    message: "Check Username",
//                    preferredStyle: .alert)
//                alertController.addAction(
//                    UIAlertAction(
//                        title: "Close",
//                        style: .cancel))
//                present(alertController,animated: true)
//            } else {
//                if passwordTextField.text?.isEmpty ?? false{
//                    let alertController = UIAlertController(
//                        title: "Error", message: "Check Password",
//                        preferredStyle: .alert)
//                    alertController.addAction(UIAlertAction(title: "Close", style: .cancel))
//                    present(alertController, animated: true)
//                }else{
//                        
//                    let alertController = UIAlertController(
//                        title: "Approved",
//                        message: "Logged In",
//                        preferredStyle: .alert)
//                    alertController.addAction(UIAlertAction(title: "Ok", style: .default))
//                    present(alertController, animated: true)
//                    
//                }
//                
//            }
//            return   }
//    }
//}


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
