//
//  WelcomeViewController.swift
//  LoginScreen
//
//  Created by Kovalyov Dmitry on 18.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var logOutButton: UIButton!
    
    var userName = "user"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = userName
    }
    
 
}
    
