//
//  NoteTests.swift
//  SimpleNoteTakingApp
//
//  Created by Hoang Tran on 9/28/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

class NoteTests: BaseUITests {
  override func beforeEach() {
    super.beforeEach()
    clearDatabase()
    loginWithCorrectCredentials()
  }

  func testEmptyNoteList() {
    expectToSee("No notes")
  }

  func testCreateNewNote() {
    addNoteWithTitle("title 0", body: "body 0")
    expectToSeeNoteWithTitle("title 0", body: "body 0", atRow: 0)
    expectNumberOfNotesInListToEqual(1)

    addNoteWithTitle("title 1", body: "body 1")
    expectToSeeNoteWithTitle("title 1", body: "body 1", atRow: 1)
    expectNumberOfNotesInListToEqual(2)
  }

  func testEditNote() {
    givenIHave3Notes()
    tapOnSecondNote()
    updateNoteTitleAndBody()
    expectToSeeNoteUpdated()
  }

  func testDeleteNote() {
    givenIHave3Notes()
    expectNumberOfNotesInListToEqual(3)
    deleteANote()
    expectNumberOfNotesInListToEqual(2)
    deleteANote()
    expectNumberOfNotesInListToEqual(1)
    deleteANote()
    expectToSee("No notes")
  }
}
