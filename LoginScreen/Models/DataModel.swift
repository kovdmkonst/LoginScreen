//
//  Model.swift
//  LoginScreen
//
//  Created by Kovalyov Dmitry on 09.03.2022.
//

import UIKit

public struct MainInformation {
    let name: String!
    let dateOfBirth: String!
    let userLocation: String!
    let userPhotoName: String!
    let userName: String!
    let password: String!
    
    static func getInformation() -> MainInformation {
        return MainInformation(name: "Kovalyov Dmitriy",
                               dateOfBirth: "08.30.1993",
                               userLocation: "Khabarovsk",
                               userPhotoName: "myPhoto",
                               userName: "user",
                               password: "password"
        )
    }
}
