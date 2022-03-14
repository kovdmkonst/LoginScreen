//
//  MainInformationViewController.swift
//  LoginScreen
//
//  Created by Kovalyov Dmitry on 14.03.2022.
//

import UIKit

class MainInformationViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var dateBirthLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.person.fullName
        dateBirthLabel.text = user?.person.dateOfBirth
        locationLabel.text = user?.person.userLocation
    }
}
