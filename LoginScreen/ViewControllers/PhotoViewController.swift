//
//  ViewController.swift
//  LoginScreen
//
//  Created by Kovalyov Dmitry on 14.03.2022.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet var photo: UIImageView!
    
    var image: UIImage?
    let myData = MainInformation.getInformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image = UIImage(named: myData.userPhotoName ?? "person.fill")
        photo.image = image
    }
    

}
