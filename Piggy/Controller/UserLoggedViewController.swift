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
    
    
    @IBOutlet weak var goalText: UILabel!

    
    var goalsArray: [Goal] = [Goal]()
    
    let ref = Database.database().reference(withPath: "piggy-567c5")
    

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
            
            let goalDB = Database.database().reference().child("Goals")
            
            let goalDictionary = ["Sender": Auth.auth().currentUser?.email,
                                  "GoalBody": textField?.text ]
            
            
            goalDB.childByAutoId().setValue(goalDictionary){
                (error, reference) in
                
                if error != nil {
                    print(error)
                }
                else {
                    print("Goal created successfully!")
                    let goal = Goal()
                    goal.goalBody = goalDictionary["GoalBody"] as! String
                    self.goalText.text = goal.goalBody
                }
            }
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    func retrieveMessages(){
        //Refer to our Goals database
        let goalDB = Database.database().reference().child("Goals")
        
        goalDB.observe(.childAdded) { (snapshot) in
            //The value property is of type ANY but we can force its coercion to dictionary because we created it
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            
            let text = snapshotValue["GoalBody"]!
            let sender = snapshotValue["Sender"]!
            
//            let goal = Goal()
//            goal.goalBody = text
            
//            self.goalText.text = goal.goalBody
            
            
//            self.goalsArray.append(goal)
            
            
            
//            let newFrame = CGRect(x:0, y:0, width:100, height:100)
//            self.goalDisplay.frame = newFrame
            
//            self.goalDisplay.text = self.goalsArray[0].goalBody
            //We need to reformat the tableview because we are changing the content of the messages
//            self.messageTableView.reloadData()
        }
        
    }
    
}

