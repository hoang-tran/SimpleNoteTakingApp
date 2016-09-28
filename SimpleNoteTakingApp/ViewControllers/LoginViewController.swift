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

  lazy var homeViewController : HomeViewController = {
    let viewController = UIStoryboard.initializeViewController(HomeViewController)
    return viewController
  }()

  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: false)
  }

  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.setNavigationBarHidden(false, animated: false)
  }

  @IBAction func onTapLoginButton(sender: AnyObject) {
    guard let username = usernameTextField.text where username.characters.count > 0 else {
      showErrorAlertWithMessage("Username cannot be empty")
      return
    }
    guard let password = passwordTextField.text where password.characters.count > 0 else {
      showErrorAlertWithMessage("Password cannot be empty")
      return
    }
    guard username == correctUsername && password == correctPassword else {
      showErrorAlertWithMessage("Username or password is incorrect")
      return
    }
    navigationController?.pushViewController(homeViewController, animated: true)
  }
}
