//
//  LoginViewController.swift
//  AboutMe
//
//  Created by Лидия Ладанюк on 05.02.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private let userName = "Lidia"
    private let password = "12345"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let helloUserVC = segue.destination as! WelcomeViewController
        helloUserVC.userName = userName
    }
    
    @IBAction func loginButton() {
        if userNameTextField.text != userName || passwordTextField.text != password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login or password",
                textField: passwordTextField
            )
            return
        }
        
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func forgotUserNameButton() {
        showAlert(title: "Oops!",
                  message: "Your name is \(userName) 😉")
    }
    
    @IBAction func forgotPasswordButton() {
        showAlert(title: "Oops!",
                  message: "Your password is \(password) 😉")
    }
    
    @IBAction func unwindSegue() {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButton()
        }
        return true
    }
}
