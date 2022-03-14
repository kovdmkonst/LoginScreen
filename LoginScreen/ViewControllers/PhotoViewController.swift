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
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image = UIImage(named: user.person.userPhotoName)
        photo.image = image
    }
    

}
