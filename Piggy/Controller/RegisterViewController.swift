//
//  RegisterViewController.swift
//  Piggy
//
//  Created by Nadia Ayala on 09/05/19.
//  Copyright © 2019 Nadia Ayala. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Working")
    }
    
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        SVProgressHUD.show()
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error!)
            }
            else {
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToMainScreen", sender: "self")
            }
        }
    }
 
    
   
   
}
