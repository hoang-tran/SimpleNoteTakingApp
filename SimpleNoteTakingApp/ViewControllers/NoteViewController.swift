//
//  NoteViewController.swift
//  SimpleNoteTakingApp
//
//  Created by Hoang Tran on 9/28/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import RealmSwift

class NoteViewController: UIViewController {
  var note: Note? {
    didSet {
      guard titleTextField != nil && bodyTextView != nil else { return }
      titleTextField.text = note?.title
      bodyTextView.text = note?.body
      navigationItem.rightBarButtonItem?.title = note != nil ? "Update" : "Create"
      onNoteTitleTextFieldChanged(titleTextField)
    }
  }

  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var bodyTextView: UITextView!

  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationButtons()
  }

  func onTapCreateButton(sender: AnyObject) {
    navigationController?.popViewControllerAnimated(true)
    saveNoteToDatabase()
    NSNotificationCenter.defaultCenter().postNotificationName(notificationNewNoteCreated, object: nil)
  }

  func onTapCancelButton(sender: AnyObject) {
    navigationController?.popViewControllerAnimated(true)
  }

  @IBAction func onNoteTitleTextFieldChanged(sender: AnyObject) {
    self.navigationItem.rightBarButtonItem?.enabled = titleTextField.text?.characters.count > 0
  }
}

extension NoteViewController {
  private func setupNavigationButtons() {
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .Plain, target: self, action: #selector(NoteViewController.onTapCreateButton))
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .Plain, target: self, action: #selector(NoteViewController.onTapCancelButton))
  }

  private func saveNoteToDatabase() {
    let realm = try! Realm()
    try! realm.write {
      let note = self.note ?? Note()
      note.title = titleTextField.text!
      note.body = bodyTextView.text!
      realm.add(note)
    }
  }
}
