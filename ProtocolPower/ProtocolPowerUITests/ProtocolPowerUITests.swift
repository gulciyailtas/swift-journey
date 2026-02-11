//
//  ProtocolPowerUITests.swift
//  ProtocolPowerUITests
//
//  Created by Gulciya Iltas on 18.01.2026.
//

import XCTest

final class ProtocolPowerUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testDeviceListAndActions() throws {
        let navTitle = app.navigationBars.staticTexts.firstMatch
        XCTAssertTrue(navTitle.exists)


        let smartPlugText = app.staticTexts["smart_plug_name"]
        let runButtons = app.buttons.matching(identifier: "btn_run")
        XCTAssertTrue(runButtons.element(boundBy: 0).exists)
        
        runButtons.element(boundBy: 0).tap()
        
        let smartFanText = app.staticTexts["smart_fan_name"]
        XCTAssertTrue(smartFanText.exists)
    }
    
}
