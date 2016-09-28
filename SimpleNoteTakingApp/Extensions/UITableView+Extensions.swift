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
    return dequeueReusableCellWithIdentifier(reuseID) ?? UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: reuseID)
  }
}
