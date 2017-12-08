//
//  LocalizableUIUITests.swift
//  LocalizableUIUITests
//
//  Created by Philipp Weiß on 17.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest

class LocalizableUIUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLanguageChange() {

        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["This cells are also localized from the storyboard."]/*[[".cells.staticTexts[\"This cells are also localized from the storyboard.\"]",".staticTexts[\"This cells are also localized from the storyboard.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Example for custom language change"]/*[[".cells.staticTexts[\"Example for custom language change\"]",".staticTexts[\"Example for custom language change\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.otherElements.containing(.navigationBar, identifier:"Overview").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .switch).matching(identifier: "1").element(boundBy: 0).swipeLeft()
        app.navigationBars["ÜbersichtEN"].buttons["ÜbersichtEN"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Die Zellen wurden auch im Storyboard localisiert.EN"]/*[[".cells.staticTexts[\"Die Zellen wurden auch im Storyboard localisiert.EN\"]",".staticTexts[\"Die Zellen wurden auch im Storyboard localisiert.EN\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
}
