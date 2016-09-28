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

extension NoteTests {
  private func expectTheCreateButtonToBeDisabled() {
    let createButton = tester().waitForViewWithAccessibilityLabel("Create") as! UIButton
    expect(createButton.enabled).to(beFalsy())
  }

  private func expectTheCreateButtonToBeEnabled() {
    let createButton = tester().waitForViewWithAccessibilityLabel("Create") as! UIButton
    expect(createButton.enabled).to(beTruthy())
  }

  private func fillInNewNoteWithTitle(title: String) {
    fillIn("Note - Title", withText: title)
  }

  private func fillInNewNoteWithBody(body: String) {
    fillIn("Note - Body", withText: body)
  }

  func addNoteWithTitle(title: String, body: String) {
    tapButton("Add note")
    expectTheCreateButtonToBeDisabled()
    fillInNewNoteWithTitle(title)
    expectTheCreateButtonToBeEnabled()
    fillInNewNoteWithBody(body)
    tapButton("Create")
  }

  func expectToSeeNoteWithTitle(title: String, body: String, atRow row: NSInteger) {
    let noteCell = tester().waitForCellAtIndexPath(NSIndexPath(forRow: row, inSection: 0), inTableViewWithAccessibilityIdentifier: "Note - TableView")
    expect(noteCell.textLabel?.text) == title
    expect(noteCell.detailTextLabel?.text) == body
  }

  func givenIHave3Notes() {
    let realm = try! Realm()
    try! realm.write {
      for i in 0...2 {
        let note = Note()
        note.title = "title \(i)"
        note.body = "body \(i)"
        realm.add(note)
      }
    }
    backToRoot()
    loginWithCorrectCredentials()
  }

  func tapOnSecondNote() {
    tester().tapRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0), inTableViewWithAccessibilityIdentifier: "Note - TableView")
  }

  func updateNoteTitleAndBody() {
    fillIn("Note - Title", withText: "updated title")
    fillIn("Note - Body", withText: "updated body")
    tapButton("Update")
  }

  func expectToSeeNoteUpdated() {
    expectToSeeNoteWithTitle("updated title", body: "updated body", atRow: 1)
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
}
