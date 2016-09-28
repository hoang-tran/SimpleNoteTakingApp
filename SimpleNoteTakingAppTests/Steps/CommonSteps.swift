//
//  CommonSteps.swift
//  SimpleNoteTakingApp
//
//  Created by Hoang Tran on 9/28/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

@testable import SimpleNoteTakingApp

extension BaseUITests {
  func tapButton(buttonName: String) {
    tester().tapViewWithAccessibilityLabel(buttonName)
  }

  func expectToSeeAlert(message: String) {
    tester().waitForViewWithAccessibilityLabel(message)
  }

  func fillIn(accessibilityLabel: String, withText text: String) {
    tester().clearTextFromAndThenEnterText(text, intoViewWithAccessibilityLabel: accessibilityLabel)
  }

  func backToRoot() {
    if let navigationController = UIApplication.sharedApplication().keyWindow?.rootViewController as? UINavigationController {
      navigationController.popToRootViewControllerAnimated(false)
    }
  }

  func loginWithCorrectCredentials() {
    fillIn("Login - Username", withText: correctUsername)
    fillIn("Login - Password", withText: correctPassword)
    tapButton("Login")
  }
}
