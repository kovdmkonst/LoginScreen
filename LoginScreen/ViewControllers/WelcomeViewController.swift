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
    
    var user: User!

    var greetings: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.person.fullName)"
    }
    
 
}
    
