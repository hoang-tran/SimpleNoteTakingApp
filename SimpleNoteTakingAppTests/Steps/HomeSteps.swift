//
//  NoteSteps.swift
//  SimpleNoteTakingApp
//
//  Created by Hoang Tran on 9/28/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

@testable import SimpleNoteTakingApp
import RealmSwift
import Nimble

extension HomeTests {

  func haveNoNotes() {
    clearDatabase()
  }

  func expectTheCreateButtonToBeDisabled() {
    let createButton = tester().waitForViewWithAccessibilityLabel("Create") as! UIButton
    expect(createButton.enabled) == false
  }

  func expectTheCreateButtonToBeEnabled() {
    let createButton = tester().waitForViewWithAccessibilityLabel("Create") as! UIButton
    expect(createButton.enabled) == true
  }

  func expectNotToSeeNoteList() {
    tester().waitForAbsenceOfViewWithAccessibilityLabel("Note - Table View")
  }

  func expectToSeeNoteWithTitle(title: String, body: String, atRow row: NSInteger) {
    let noteCell = tester().waitForCellAtIndexPath(NSIndexPath(forRow: row, inSection: 0), inTableViewWithAccessibilityIdentifier: "Note - TableView")
    expect(noteCell.textLabel?.text) == title
    expect(noteCell.detailTextLabel?.text) == body
  }

  func have3Notes() {
    let realm = try! Realm()
    try! realm.write {
      for i in 0...2 {
        let note = Note()
        note.title = "title \(i)"
        note.body = "body \(i)"
        realm.add(note)
      }
    }
  }

  func fillInNoteTitle(title: String) {
    fillIn("Note - Title", withText: title)
  }

  func fillInNoteBody(body: String) {
    fillIn("Note - Body", withText: body)
  }


  func updateNoteTitleTo(title: String) {
    fillInNoteTitle(title)
  }

  func updateNoteBodyTo(body: String) {
    fillInNoteBody(body)
  }

  func tapOnNoteAtRow(row: Int) {
    let indexPath = NSIndexPath(forRow: row, inSection: 0)
    tester().tapRowAtIndexPath(indexPath, inTableViewWithAccessibilityIdentifier: "Note - TableView")
  }

  func expectNumberOfNotesInListToEqual(count: Int) {
    let noteTableView = tester().waitForViewWithAccessibilityLabel("Note - TableView") as! UITableView
    expect(noteTableView.numberOfRowsInSection(0)) == count
  }

  func deleteANote() {
    let noteTableView = tester().waitForViewWithAccessibilityLabel("Note - TableView") as! UITableView
    tester().swipeRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), inTableView: noteTableView, inDirection: .Left)
    tapButton("Delete")
  }

  func expectToSeeLabel(label: String) {
    expectToSee(label)
  }

}
