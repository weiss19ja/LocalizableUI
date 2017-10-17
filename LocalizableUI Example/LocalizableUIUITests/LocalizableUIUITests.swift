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
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLanguageChange() {
        
        let app = XCUIApplication()
        let overviewNavigationBar = app.navigationBars["Overview"]
        overviewNavigationBar.otherElements["Overview"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["This cells are also localized from the storyboard."]/*[[".cells.staticTexts[\"This cells are also localized from the storyboard.\"]",".staticTexts[\"This cells are also localized from the storyboard.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Example for UIButton and UISegmentedControl"]/*[[".cells.staticTexts[\"Example for UIButton and UISegmentedControl\"]",".staticTexts[\"Example for UIButton and UISegmentedControl\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let navigationBarsQuery = app.navigationBars
        navigationBarsQuery.otherElements["Example for UIButton and UISegmentedControl"].tap()
        app.buttons["Custom button text"].tap()
        
        let app2 = app
        app2/*@START_MENU_TOKEN@*/.buttons["Segment 1"]/*[[".segmentedControls.buttons[\"Segment 1\"]",".buttons[\"Segment 1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.buttons["Segment 2"]/*[[".segmentedControls.buttons[\"Segment 2\"]",".buttons[\"Segment 2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app2/*@START_MENU_TOKEN@*/.buttons["Segment 3"]/*[[".segmentedControls.buttons[\"Segment 3\"]",".buttons[\"Segment 3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let overviewButton = navigationBarsQuery.buttons["Overview"]
        overviewButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Example for UILabel, UITextField and UITextView"]/*[[".cells.staticTexts[\"Example for UILabel, UITextField and UITextView\"]",".staticTexts[\"Example for UILabel, UITextField and UITextView\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        navigationBarsQuery.otherElements["Example for UILabel, UITextField and UITextView"].tap()
        app.staticTexts["Custom label text"].tap()
        app.textFields["Custom placeholder text"].tap()
        overviewButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Example for UITabBar"]/*[[".cells.staticTexts[\"Example for UITabBar\"]",".staticTexts[\"Example for UITabBar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Tab 1"].otherElements["Tab 1"].tap()
        app.staticTexts["Tab 1"].tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Tab 1"].tap()
        tabBarsQuery.buttons["Tab 2"].tap()
        app.staticTexts["Tab 2"].tap()
        
        let tab2NavigationBar = app.navigationBars["Tab 2"]
        tab2NavigationBar.otherElements["Tab 2"].tap()
        tab2NavigationBar.buttons["Cancel"].tap()
        
        let exampleForCustomLanguageChangeStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Example for custom language change"]/*[[".cells.staticTexts[\"Example for custom language change\"]",".staticTexts[\"Example for custom language change\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        exampleForCustomLanguageChangeStaticText.tap()
        app.staticTexts["Click to change language"].tap()
        overviewNavigationBar.buttons["Overview"].tap()
        exampleForCustomLanguageChangeStaticText.tap()
        app.switches["1"].swipeLeft()
        app.staticTexts["Deaktivieren zum Sprachwechsel"].tap()

        let bersichtNavigationBar = app.navigationBars["Übersicht"]
        bersichtNavigationBar.buttons["Übersicht"].tap()
        bersichtNavigationBar.otherElements["Übersicht"].tap()
        
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Die Zellen wurden auch im Storyboard localisiert."]/*[[".cells.staticTexts[\"Die Zellen wurden auch im Storyboard localisiert.\"]",".staticTexts[\"Die Zellen wurden auch im Storyboard localisiert.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Beispiel für UIButton und UISegmentedControl"]/*[[".cells.staticTexts[\"Beispiel für UIButton und UISegmentedControl\"]",".staticTexts[\"Beispiel für UIButton und UISegmentedControl\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        app.navigationBars.otherElements["Beispiel für UIButton und UISegmentedControl"].tap()
        app.buttons["Beispiel Button Text"].tap()

        app/*@START_MENU_TOKEN@*/.buttons["Segment 1"]/*[[".segmentedControls.buttons[\"Segment 1\"]",".buttons[\"Segment 1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Segment 2"]/*[[".segmentedControls.buttons[\"Segment 2\"]",".buttons[\"Segment 2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Segment 3"]/*[[".segmentedControls.buttons[\"Segment 3\"]",".buttons[\"Segment 3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let bersichtButton = navigationBarsQuery.buttons["Übersicht"]
        bersichtButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Beispiel für UILabel, UITextField und UITextView"]/*[[".cells.staticTexts[\"Beispiel für UILabel, UITextField und UITextView\"]",".staticTexts[\"Beispiel für UILabel, UITextField und UITextView\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        navigationBarsQuery.otherElements["Beispiel für UILabel, UITextField und UITextView"].tap()
        app.staticTexts["Beispiel für ein Label"].tap()
        app.textFields["Eigener Platzhalter"].tap()
        bersichtButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Beispiel für UITabBar"]/*[[".cells.staticTexts[\"Beispiel für UITabBar\"]",".staticTexts[\"Beispiel für UITabBar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Tap 1"].otherElements["Tap 1"].tap()
        app.staticTexts["Tap 1"].tap()
        
        app.tabBars.buttons["Tap 1"].tap()
        app.tabBars.buttons["Tap 2"].tap()
        app.staticTexts["Tap 2"].tap()
        
        let tap2NavigationBar = app.navigationBars["Tap 2"]
        tap2NavigationBar.otherElements["Tap 2"].tap()
        tap2NavigationBar.buttons["Abbrechen"].tap()
    }
    
}
