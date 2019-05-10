//
//  RegisterViewController.swift
//  Piggy
//
//  Created by Nadia Ayala on 09/05/19.
//  Copyright © 2019 Nadia Ayala. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        print("Clicked")
    }
    //    @IBAction func registerPressed(_se) {
////        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
////            if error != nil {
////                print(error)
////            }
////            else {
//                print("Registration successful!")
////            }
////        }
    
        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Working")
    }
    
   
}
