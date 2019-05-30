//
//  LoginViewController.swift
//  Piggy
//
//  Created by Nadia Ayala on 09/05/19.
//  Copyright © 2019 Nadia Ayala. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginViewController: UIViewController {
     
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error)
            }
            else{
                
                
                self.performSegue(withIdentifier: "goToMainScreen", sender: self)
            }
            SVProgressHUD.dismiss()
            
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Working")
    }
    
    
}

