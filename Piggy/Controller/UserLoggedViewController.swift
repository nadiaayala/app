//
//  UserLoggedViewController.swift
//  Piggy
//
//  Created by Nadia Ayala on 11/05/19.
//  Copyright © 2019 Nadia Ayala. All rights reserved.
//

import UIKit
import Firebase

class UserLoggedViewController: UIViewController {
    
    let ref = Database.database().reference(withPath: "grocery-items")
    

    @IBAction func addGoalPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Add goal ", message: "What is the goal you want to achieve?", preferredStyle: .alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = "..."
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            let newGoal = Goal()
            newGoal.goalBody = (textField?.text)!
            print(newGoal.goalBody)
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
        
//        newGoal.goalBody: String = ""
    }
    
}

