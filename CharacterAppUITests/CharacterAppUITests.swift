//
//  CharacterAppUITests.swift
//  CharacterAppUITests
//
//  Created by Mahmoud Maamoun on 04/05/2024.
//

import XCTest

final class CharacterAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let charstableView = app.tables["charsList"]
        XCTAssertNotNil(charstableView, "TableView is Released")
        
       // Check the navigation bar title
//        let navBar = app.navigationBars["CharactersNavigationBar"]
//        XCTAssertEqual(navBar.title, "Characters")
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPagination() {
        
        let app = XCUIApplication()
        app.launch()
        let table = app.tables["charsList"]
        // Assume we have a initNumofRows
        let initialnumOfRows = 20
        let newCount = initialnumOfRows + 20
        
        // Assert that we have a cell in that position
        let cell = table.cells.element(boundBy: newCount - 1)
        XCTAssertNotNil(cell)
        
        table.scrollToElement(element: cell)
        // Test the count of table view cells that it already incremented per page
        XCTAssertGreaterThan(table.cells.count, newCount )
        cell.tap()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
            XCUIApplication().tables["charsList"].children(matching: .cell).element(boundBy: 4).children(matching: .other).element(boundBy: 1).children(matching: .other).element.swipeUp()
        }
    }
}

extension XCUIElement {
    func scrollToElement(element: XCUIElement) {
        while !element.visible() {
            swipeUp()
        }
    }
    
    func visible() -> Bool {
        guard exists && !frame.isEmpty else {
            return false
        }
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(frame)
    }
}
