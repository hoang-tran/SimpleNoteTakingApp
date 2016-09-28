//
//  UIStoryboard+Extensions.swift
//  SimpleNoteTakingApp
//
//  Created by Hoang Tran on 9/27/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

extension UIStoryboard {
  class func main() -> UIStoryboard {
    return UIStoryboard(name: "Main", bundle: nil)
  }

  class func initializeViewController<T where T: UIViewController>(viewController: T.Type) -> T {
    return UIStoryboard.main().instantiateViewControllerWithIdentifier(String(T)) as! T
  }
}
