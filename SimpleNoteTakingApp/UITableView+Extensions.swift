//
//  UITableView+Extensions.swift
//  SimpleNoteTakingApp
//
//  Created by Hoang Tran on 9/27/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

extension UITableView {
  func defaultCellWithReuseID(reuseID: String) -> UITableViewCell {
    return self.dequeueReusableCellWithIdentifier(reuseID) ?? UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: reuseID)
  }
}
