//
//  ViewController.swift
//  LoginScreen
//
//  Created by Kovalyov Dmitry on 18.01.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - IBOutlets declaration
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var forgottenNameButton: UIView!
    @IBOutlet var forgottenPasswordButton: UIButton!
    
    // MARK: - Private properties declaration
    
    private let user = User.getUserInfo()
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        userNameTextField.becomeFirstResponder()
        
        userNameTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }

        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navController = viewController as? UINavigationController {
                let mainInfoVC = navController.topViewController as? MainInformationViewController
                mainInfoVC?.user = user
                let photoVC = navController.topViewController as? PhotoViewController
                photoVC?.user = user
            }
        }
        
        guard userNameTextField.text == user.userName, passwordTextField.text == user.password
        else {
            showAlert(
                title: "Invalid login or password",
                message: "Please enter correct your personal data")
            return
        }
        }
        
//        viewControllers.forEach {
//            if let welcomeVC = $0 as? WelcomeViewController {
//                welcomeVC.user = user
//            } else if let navigationVC = $0 as? UINavigationController {
//                let mainInfoVC = navigationVC.topViewController as? MainInformationViewController
//                mainInfoVC?.user = user
//            } else if let navigationVC = $0 as? UINavigationController {
//                let photoVC = navigationVC.topViewController as? PhotoViewController
//                photoVC?.user = user
//            }
//        }
        
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
        
        passwordTextField.resignFirstResponder()
        userNameTextField.becomeFirstResponder()
    }
    
    @IBAction func forgotNameButtonTapped() {
        showAlert(title: "Hey, User!", message: "Your username is \(user.userName )")
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(title: "Hey, User!", message: "Your password is \(user.password )")
    }
    
    // MARK: - Public methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else { performSegue(withIdentifier: "welcomeVC", sender: nil)
        }
        return true }
}

//MARK: - Extensions

extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
