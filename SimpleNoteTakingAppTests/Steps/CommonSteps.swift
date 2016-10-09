//
//  CommonSteps.swift
//  SimpleNoteTakingApp
//
//  Created by Hoang Tran on 9/28/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

@testable import SimpleNoteTakingApp
import RealmSwift

extension BaseUITests {
  func tapButton(buttonName: String) {
    tester().tapViewWithAccessibilityLabel(buttonName)
  }

  func expectToSeeAlert(message: String) {
    expectToSee(message)
  }

  func fillIn(accessibilityLabel: String, withText text: String) {
    tester().clearTextFromAndThenEnterText(text, intoViewWithAccessibilityLabel: accessibilityLabel)
  }

  func backToRoot() {
    if let navigationController = UIApplication.sharedApplication().keyWindow?.rootViewController as? UINavigationController {
      navigationController.popToRootViewControllerAnimated(false)
    }
  }

  func fillInUsername() {
    fillIn("Login - Username", withText: correctUsername)
  }

  func visitHomeScreen() {
    fillInUsername()
    fillInCorrectPassword()
    tapButton("Login")
  }
  
  func fillInCorrectPassword() {
    fillIn("Login - Password", withText: correctPassword)
  }


  func useTestDatabase() {
    Realm.Configuration.defaultConfiguration.inMemoryIdentifier = name
  }

  func clearDatabase() {
    let realm = try! Realm()
    try! realm.write {
      realm.deleteAll()
    }
  }

  func expectToSee(text: String) {
    tester().waitForViewWithAccessibilityLabel(text)
  }

}
