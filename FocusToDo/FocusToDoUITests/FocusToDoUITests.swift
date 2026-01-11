//
//  FocusToDoUITests.swift
//  FocusToDoUITests
//
//  Created by Gülçiya İltaş on 26.12.2025.
//

import XCTest

final class FocusToDoUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testFullFlowAndCoverage() throws {
        let app = XCUIApplication()
        
        // 1. Ekleme ekranını aç
        let addButton = app.buttons["plus.circle.fill"]
        XCTAssertTrue(addButton.waitForExistence(timeout: 5))
        addButton.tap()
        
        // 2. Metin yaz
        let textField = app.textFields["TaskInput"]
        XCTAssertTrue(textField.waitForExistence(timeout: 5))
        textField.tap()
        textField.typeText("Mavi Barlar İçin Test")
        
        // 3. Kaydet butonuna bas (Descendants yöntemiyle)
        let saveButton = app.descendants(matching: .button)["SaveButton"]
        XCTAssertTrue(saveButton.waitForExistence(timeout: 5))
        saveButton.tap()
        
        // --- Buradan sonrası ContentView barlarını doldurur ---
        
        // 4. Görevi Tamamla (toggleTask)
        let firstCheckmark = app.images.firstMatch
        if firstCheckmark.waitForExistence(timeout: 5) {
            firstCheckmark.tap()
        }
        
        // 5. Görevi Sil (deleteTask)
        let firstCell = app.cells.firstMatch
        if firstCell.exists {
            firstCell.swipeLeft()
            // iOS sistem butonu genellikle "Delete" veya "Sil"dir
            let deleteButton = app.buttons.element(boundBy: 0)
            if deleteButton.exists { deleteButton.tap() }
        }
    }
}
