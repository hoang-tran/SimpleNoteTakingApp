//
//  UIViewController+Extensions.swift
//  SimpleNoteTakingApp
//
//  Created by Hoang Tran on 9/27/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

extension UIViewController {
  func showErrorAlertWithMessage(message: String) {
    let alertController = UIAlertController(title: "Error", message:message, preferredStyle: .Alert)
    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil))
    presentViewController(alertController, animated: true, completion: nil)
  }
}
