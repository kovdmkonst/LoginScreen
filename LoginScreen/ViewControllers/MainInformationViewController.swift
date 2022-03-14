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
    
    let myData = MainInformation.getInformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = myData.realName
        dateBirthLabel.text = myData.dateOfBirth
        locationLabel.text = myData.userLocation
    }
}
