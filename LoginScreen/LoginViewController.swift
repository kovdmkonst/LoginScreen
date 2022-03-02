//
//  ViewController.swift
//  LoginScreen
//
//  Created by Kovalyov Dmitry on 18.01.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var commonStackView: UIStackView!
    
    @IBOutlet weak var logInButton: UIButton!
    
    @IBOutlet var forgottenNameButton: UIView!
    @IBOutlet weak var forgottenPasswordButton: UIButton!
    
  
    
    let userName = "user"
    let password = "password"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
        userNameTextField.becomeFirstResponder()
        
        userNameTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
        
        textFieldShouldReturn(userNameTextField)
        
        
        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(updateStackView(notification:)),
//                                               name: UIResponder.keyboardWillShowNotification,
//                                               object: nil)
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
        welcomeVC.userName = "Welcome, \(userName)"
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let _ = segue.source as? WelcomeViewController else { return }
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func forgotNameButtonTapped() {
        showAlert(title: "Hey, User!", message: "Your username is \(userName)")
    }
    
    @IBAction func forgotPasswordButtonTapped() {
        showAlert(title: "Hey, User!", message: "Your password is \(password)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
//    @objc func updateStackView(notification: Notification) {
//        guard
//            let userInfo = notification.userInfo as? [String: Any],
//            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
//        else { return }
//
//        if notification.name == UIResponder.keyboardWillHideNotification {
//            commonStackView.frame.origin.y += 10
//        } else {
//            commonStackView.frame.origin.y = keyboardFrame.height - 10
//        }
//    }
    
    func textFieldShouldReturn(_ firstTextField: UITextField) -> Bool {
        passwordTextField.becomeFirstResponder()
        return true }
    
    
   
}


extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTextField.text = ""
            self.passwordTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
