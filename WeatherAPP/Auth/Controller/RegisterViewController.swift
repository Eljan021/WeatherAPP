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
        
//        func backtologim(){
//            navigationController?.popViewController(animated: true)
//        }

        // Do any additional setup after loading the view.
    }
}
