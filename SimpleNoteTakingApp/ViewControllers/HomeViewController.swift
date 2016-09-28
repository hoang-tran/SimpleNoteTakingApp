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

  lazy var noteViewController : NoteViewController = {
    let viewController = UIStoryboard.initializeViewController(NoteViewController)
    let _ = viewController.view
    return viewController
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    updateNotes()
    NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeViewController.onNewNoteCreated), name: notificationNewNoteCreated, object: nil)
  }

  @IBAction func onTapAddNoteButton(sender: AnyObject) {
    noteViewController.note = nil
    navigationController?.pushViewController(noteViewController, animated: true)
  }

  func onNewNoteCreated() {
    updateTableViewVisibility()
    notesTableView.reloadData()
  }
}

extension HomeViewController {
  func updateNotes() {
    let realm = try! Realm()
    notes = realm.objects(Note)
    updateTableViewVisibility()
  }

  func updateTableViewVisibility() {
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

  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    noteViewController.note = notes![indexPath.row]
    navigationController?.pushViewController(noteViewController, animated: true)
  }

  func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }

  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      let realm = try! Realm()
      try! realm.write {
        realm.delete(notes![indexPath.row])
      }
      tableView.beginUpdates()
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
      tableView.endUpdates()
      updateTableViewVisibility()
    }
  }

  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 60
  }
}
