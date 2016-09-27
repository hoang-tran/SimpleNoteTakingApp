//
//  ViewController.swift
//  SimpleNoteTakingApp
//
//  Created by Hoang Tran on 9/27/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!

  @IBAction func onTapLoginButton(sender: AnyObject) {
    guard let username = usernameTextField.text where username.characters.count > 0 else {
      showErrorAlertWithMessage("Username cannot be empty")
      return
    }
    guard let password = passwordTextField.text where password.characters.count > 0 else {
      showErrorAlertWithMessage("Password cannot be empty")
      return
    }
    guard usernameAndPasswordAreCorrect(username, password: password) else {
      showErrorAlertWithMessage("Username or password is incorrect")
      return
    }
    print("proceed to home view controller")
  }

}

extension LoginViewController {
  func usernameAndPasswordAreCorrect(username: String, password: String) -> Bool {
    let correctUsername = "appcoda"
    let correctPassword = "password"
    return username == correctUsername && password == correctPassword
  }
}


