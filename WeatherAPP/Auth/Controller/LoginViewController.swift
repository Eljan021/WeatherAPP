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

    @IBAction func forgotPassword(_ sender: Any) {
        let vc = UIStoryboard(name: "Login", bundle: Bundle.main).instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController
        
        navigationController?.pushViewController(vc!, animated: true)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

