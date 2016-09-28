//
//  LoginTests.swift
//  SimpleNoteTakingApp
//
//  Created by Hoang Tran on 9/28/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

class LoginTests: BaseUITests {
  override func beforeEach() {
    super.beforeEach()
    clearLoginForm()
  }

  func testEmptyUsername() {
    tapButton("Login")
    expectToSeeAlert("Username cannot be empty")
    tapButton("OK")
  }

  func testEmptyPassword() {
    fillInWrongUsername()
    tapButton("Login")
    expectToSeeAlert("Password cannot be empty")
    tapButton("OK")
  }

  func testWrongCredentials() {
    fillInWrongUsername()
    fillInWrongPassword()
    tapButton("Login")
    expectToSeeAlert("Username or password is incorrect")
    tapButton("OK")
  }

  func testCorrectCredentials() {
    loginWithCorrectCredentials()
    expectToGoToHomeScreen()
  }
}
