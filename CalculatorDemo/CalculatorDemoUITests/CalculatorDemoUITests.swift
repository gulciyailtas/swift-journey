//
//  CalculatorDemoUITests.swift
//  CalculatorDemoUITests
//
//  Created by Gülçiya İltaş on 20.11.2025.
//

import XCTest

final class CalculatorDemoUITests: XCTestCase {
    func testIncreaseButton() {
        let app = XCUIApplication()
        app.launch()

        let label = app.staticTexts["countLabel"]
        let button = app.buttons["plusButton"]

        XCTAssertTrue(label.exists)
        XCTAssertTrue(button.exists)

        XCTAssertEqual(label.label, "Count: 0")

        button.tap()

        XCTAssertEqual(label.label, "Count: 1")
    }
    func testIncreaseButtonAndLifecycle() { // Metot adını güncelledim
            let app = XCUIApplication()
            app.launch()

            let label = app.staticTexts["countLabel"]
            let button = app.buttons["plusButton"]

            // 1. Sayaç artırma kontrolü (Mevcut test mantığı)
            XCTAssertTrue(label.exists)
            XCTAssertTrue(button.exists)
            XCTAssertEqual(label.label, "Count: 0")
            button.tap()
            XCTAssertEqual(label.label, "Count: 1")

            // 2. Yaşam Döngüsü Kontrolü (SceneDelegate metotlarını tetikler)
            
            // Uygulamayı arka plana gönder
            XCUIDevice.shared.press(XCUIDevice.Button.home)
            
            // Uygulamanın arka plana geçmesi için kısa bir bekleme (opsiyonel ama iyi bir pratik)
            // 1 saniye beklemek genellikle yeterlidir.
            let backgroundExpectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "state == %d", XCUIApplication.State.runningBackground.rawValue), object: app)
            XCTWaiter.wait(for: [backgroundExpectation], timeout: 2.0)
            
            // Uygulamayı tekrar ön plana getir
            app.activate()

            // 3. Ön plana geldikten sonra state'in doğru olup olmadığını kontrol et
            // Uygulamanın tekrar 'runningForeground' durumuna geçmesini bekleyebiliriz.
            let foregroundExpectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: "state == %d", XCUIApplication.State.runningForeground.rawValue), object: app)
            XCTWaiter.wait(for: [foregroundExpectation], timeout: 2.0)
            
            // Değerin hala 'Count: 1' olduğunu doğrula (state değişimi sayacı sıfırlamamalı)
            XCTAssertEqual(label.label, "Count: 1", "Arka plana gitme ve geri gelme, sayacı sıfırlamamalıdır.")
        }


    }

