//
//  Model.swift
//  LoginScreen
//
//  Created by Kovalyov Dmitry on 09.03.2022.
//

import UIKit

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUserInfo() -> User {
        User(
            userName: "user",
            password: "password",
            person: Person.getPersonInfo()
        )
    }
}


struct Person {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }

    let dateOfBirth: String
    let userLocation: String
    let userPhotoName: String
    
    static func getPersonInfo() -> Person {
        Person(
            name: "Dmitriy",
            surname: "Kovalyov",
            dateOfBirth: "08.30.1993",
            userLocation: "Khabarovsk",
            userPhotoName: "myPhoto"
        )
    }
}
