//
//  WelcomeViewController.swift
//  LoginScreen
//
//  Created by Kovalyov Dmitry on 18.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var greetings = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = greetings
    }
    
 
}
    
