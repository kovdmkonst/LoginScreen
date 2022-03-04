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
    
    private let userName = "user"
    private let password = "password"
    
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
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        guard userNameTextField.text == userName, passwordTextField.text == password
        else {
            showAlert(
                title: "Invalid login or password",
                message: "Please enter correct your personal data")
            return
        }
        welcomeVC.greetings = "Welcome, \(userName)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
        userNameTextField.becomeFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    @IBAction func forgotNameButtonTapped() {
        showAlert(title: "Hey, User!", message: "Your username is \(userName)")
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(title: "Hey, User!", message: "Your password is \(password)")
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
