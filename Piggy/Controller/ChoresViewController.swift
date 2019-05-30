//
//  ChoresViewController.swift
//  Piggy
//
//  Created by Nadia Ayala on 29/05/19.
//  Copyright © 2019 Nadia Ayala. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class ChoresViewController: UITableViewController {
    
    let realm = (UIApplication.shared.delegate as! AppDelegate).realm
    
    var chores: Results<Chore>?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        load()
        
        print("Working")
    }
    
    //MARK: - ADD NEW CHORES
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
        var textField = UITextField()
        
        let alertController = UIAlertController(title: "Add item", message: " ", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if textField.text != "" {
                let chore = Chore()
                chore.title = textField.text!
                
                let dateFormatter : DateFormatter = DateFormatter()
                //        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                dateFormatter.dateFormat = "yyyy-MMM-dd HH:mm:ss"
                let date = Date()
                let dateString = dateFormatter.string(from: date)
                chore.date = date
                //                let interval = date.timeIntervalSince1970
                //
               self.save(choreToSave: chore)
               self.load()
               print(self.chores)
                
            }
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alertController.addAction(cancelAction)
        alertController.addAction(action)
        
        alertController.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    //MARK: - TableView methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (chores?.count) ?? 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("a")
        
        if let chore = chores?[indexPath.row] {
            do {
                try realm.write {
                    chore.done =  !chore.done
                    print(chore.done)
                }
            }
                catch let error {
                    print("Error saving status: \(error)")
                }
                
            }
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "choreCell", for: indexPath)
        let chore = chores?[indexPath.row]
        cell.textLabel?.text = chore?.title ?? "No chores added yet"
        
//        cell.accessoryType = (chore?.done)! ? .checkmark : .none
        if (chore?.done == false){
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        
        
        return cell
    }
    

    
    
    
    //MARK: - MANAGE DATA WITH REALM
    
    func save(choreToSave: Chore){
        
        do{
            try  realm.write {
                realm.add(choreToSave)
            }
        }
        catch let error {
            print("Error: \(error)")
        }
    }
    
    
    func load() {
        chores = realm.objects(Chore.self)
        chores = chores?.sorted(byKeyPath: "date", ascending: false)
        tableView.reloadData()
    }

}
