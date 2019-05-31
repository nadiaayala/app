
//
//  homeScreenViewController.swift
//  Piggy
//
//  Created by Nadia Ayala on 30/05/19.
//  Copyright © 2019 Nadia Ayala. All rights reserved.
//

import UIKit
import Foundation

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var goalTextLabel: UITextField!
    @IBOutlet weak var goalPriceText: UITextField!
    
    var goalText: String? {
        didSet{
            goalTextLabel.text = goalText
            print(goalTextLabel.text)
        }
    }
    
    var goalPrice: String? {
        didSet{
            goalPriceText.text = goalPrice
            print(goalPriceText.text)
        }
    }
    
    override func viewDidLoad() {
        print(goalPrice)
    }
    
    
    @IBAction func seeChoresButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToChores", sender: "self")
    }
    
}
//goToChores
