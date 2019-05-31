//
//  UserLoggedViewController.swift
//  Piggy
//
//  Created by Nadia Ayala on 11/05/19.
//  Copyright © 2019 Nadia Ayala. All rights reserved.
//

import UIKit

class UserLoggedViewController: UIViewController, UIImagePickerControllerDelegate {
    
    
    
    @IBOutlet weak var goalText: UILabel!
    @IBOutlet weak var goalPriceText: UILabel!
    
    
    //MARK: - ADD NEW GOAL
    
    @IBAction func addGoalPressed(_ sender: UIButton) {
        var textField = UITextField()
        var priceField = UITextField()
        
        
        let alertController = UIAlertController(title: "Add new goal:", message: " ", preferredStyle: .alert)
        
        let addAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if textField.text != "" {
                self.performSegue(withIdentifier: "goalCreated", sender: self)
                
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        
        alertController.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add new goal:"
            textField = alertTextField
        }
        alertController.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add price:"
        }
        
        present(alertController, animated: true, completion: nil)
    }

    
}

