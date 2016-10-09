//
//  LoginSteps.swift
//  SimpleNoteTakingApp
//
//  Created by Hoang Tran on 9/28/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

extension LoginTests {
  func clearOutUsernameAndPasswordFields() {
    tester().clearTextFromViewWithAccessibilityLabel("Login - Username")
    tester().clearTextFromViewWithAccessibilityLabel("Login - Password")
  }

  func fillInWrongPassword() {
    fillIn("Login - Password", withText: "wrongPassword")
  }

  func expectToGoToHomeScreen() {
    tester().waitForAbsenceOfViewWithAccessibilityLabel("Login - Username")
    tester().waitForAbsenceOfViewWithAccessibilityLabel("Login - Password")
    tester().waitForAbsenceOfViewWithAccessibilityLabel("Login")
    tester().waitForViewWithAccessibilityLabel("No notes")
    tester().waitForViewWithAccessibilityLabel("Add note")
  }
}