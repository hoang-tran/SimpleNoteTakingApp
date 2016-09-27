//
//  HomeViewController.swift
//  SimpleNoteTakingApp
//
//  Created by Hoang Tran on 9/27/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
  @IBOutlet weak var emptyNotesLabel: UILabel!
  @IBOutlet weak var notesTableView: UITableView!

  var notes: Results<Note>?

  override func viewDidLoad() {
    super.viewDidLoad()
    updateNotes()
  }

  @IBAction func onTapAddNoteButton(sender: AnyObject) {
  }
}

extension HomeViewController {
  func updateNotes() {
    let realm = try! Realm()
    notes = realm.objects(Note)
    emptyNotesLabel.hidden = notes?.count > 0
    notesTableView.hidden = !emptyNotesLabel.hidden
  }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }

  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notes?.count ?? 0
  }

  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.defaultCellWithReuseID("reuseID")
    let note = notes![indexPath.row]
    cell.textLabel?.text = note.title
    cell.detailTextLabel?.text = note.body
    return cell
  }

  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 50
  }
}
