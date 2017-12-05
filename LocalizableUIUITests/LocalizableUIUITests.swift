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
        let overviewNavigationBar = app.navigationBars["Overview"]
        overviewNavigationBar.otherElements["Overview"].tap()

        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Example for UIButton and UISegmentedControl"]/*[[".cells.staticTexts[\"Example for UIButton and UISegmentedControl\"]",".staticTexts[\"Example for UIButton and UISegmentedControl\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let exampleForUibuttonAndUisegmentedcontrolNavigationBar = app.navigationBars["Example for UIButton and UISegmentedControl"]
        exampleForUibuttonAndUisegmentedcontrolNavigationBar.otherElements["Example for UIButton and UISegmentedControl"].tap()
        app.buttons["Custom button text"].tap()

        app/*@START_MENU_TOKEN@*/.buttons["Segment 2"]/*[[".segmentedControls.buttons[\"Segment 2\"]",".buttons[\"Segment 2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Segment 3"]/*[[".segmentedControls.buttons[\"Segment 3\"]",".buttons[\"Segment 3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        exampleForUibuttonAndUisegmentedcontrolNavigationBar.buttons["Overview"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Example for UILabel, UITextField and UITextView"]/*[[".cells.staticTexts[\"Example for UILabel, UITextField and UITextView\"]",".staticTexts[\"Example for UILabel, UITextField and UITextView\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.staticTexts["Custom label text"].tap()

        let exampleForUilabelUitextfieldAndUitextviewNavigationBar = app.navigationBars["Example for UILabel, UITextField and UITextView"]
        exampleForUilabelUitextfieldAndUitextviewNavigationBar.otherElements["Example for UILabel, UITextField and UITextView"].tap()
        exampleForUilabelUitextfieldAndUitextviewNavigationBar.buttons["Overview"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Example for UITabBar"]/*[[".cells.staticTexts[\"Example for UITabBar\"]",".staticTexts[\"Example for UITabBar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Tab 1"].otherElements["Tab 1"].tap()
        app.staticTexts["Tab 1"].tap()

        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Tab 2"].tap()
        app.staticTexts["Tab 2"].tap()

        let tab2NavigationBar = app.navigationBars["Tab 2"]
        tab2NavigationBar.otherElements["Tab 2"].tap()
        tab2NavigationBar.buttons["Cancel"].tap()

        let exampleForCustomLanguageChangeStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Example for custom language change"]/*[[".cells.staticTexts[\"Example for custom language change\"]",".staticTexts[\"Example for custom language change\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        exampleForCustomLanguageChangeStaticText.tap()

        let overviewButton = overviewNavigationBar.buttons["Overview"]
        overviewButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Example for a custom View"]/*[[".cells.staticTexts[\"Example for a custom View\"]",".staticTexts[\"Example for a custom View\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.staticTexts["My Custom View"].tap()
        overviewButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Example Alert"]/*[[".cells.staticTexts[\"Example Alert\"]",".staticTexts[\"Example Alert\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let titleAlert = app.alerts["title"]
        titleAlert.staticTexts["title"].tap()
        titleAlert.staticTexts["message"].tap()
        titleAlert.buttons["button"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["This cells are also localized from the storyboard."]/*[[".cells.staticTexts[\"This cells are also localized from the storyboard.\"]",".staticTexts[\"This cells are also localized from the storyboard.\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        exampleForCustomLanguageChangeStaticText.tap()
        app.otherElements.containing(.navigationBar, identifier:"Overview").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .switch).matching(identifier: "1").element(boundBy: 0).swipeLeft()

        let bersichtenButton = app.navigationBars["ÜbersichtEN"].buttons["ÜbersichtEN"]
        bersichtenButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Beispiel für UIButton und UISegmentedControlEN"]/*[[".cells.staticTexts[\"Beispiel für UIButton und UISegmentedControlEN\"]",".staticTexts[\"Beispiel für UIButton und UISegmentedControlEN\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Beispiel Button TextEN"].tap()
        app.otherElements.containing(.navigationBar, identifier:"Beispiel für UIButton und UISegmentedControlEN").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Segment 2EN"]/*[[".segmentedControls.buttons[\"Segment 2EN\"]",".buttons[\"Segment 2EN\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.buttons["Segment 3EN"]/*[[".segmentedControls.buttons[\"Segment 3EN\"]",".buttons[\"Segment 3EN\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Beispiel für UIButton und UISegmentedControlEN"].buttons["ÜbersichtEN"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Beispiel für UILabel, UITextField und UITextViewEN"]/*[[".cells.staticTexts[\"Beispiel für UILabel, UITextField und UITextViewEN\"]",".staticTexts[\"Beispiel für UILabel, UITextField und UITextViewEN\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.staticTexts["Beispiel für ein LabelEN"].tap()
        app.textFields["Eigener PlatzhalterEN"].tap()
        app.otherElements.containing(.navigationBar, identifier:"Beispiel für UILabel, UITextField und UITextViewEN").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element.tap()
        app.navigationBars["Beispiel für UILabel, UITextField und UITextViewEN"].buttons["ÜbersichtEN"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Beispiel für UITabBarEN"]/*[[".cells.staticTexts[\"Beispiel für UITabBarEN\"]",".staticTexts[\"Beispiel für UITabBarEN\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.staticTexts["Tap 1EN"].tap()
        tabBarsQuery.buttons["Tap 2EN"].tap()

        let tap2enNavigationBar = app.navigationBars["Tap 2EN"]
        tap2enNavigationBar.otherElements["Tap 2EN"].tap()
        tap2enNavigationBar.buttons["AbbrechenEN"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Beispiel für eine custom ViewEN"]/*[[".cells.staticTexts[\"Beispiel für eine custom ViewEN\"]",".staticTexts[\"Beispiel für eine custom ViewEN\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.staticTexts["Mein Custom ViewEN"].tap()
        bersichtenButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Beispiel für eine AlertEN"]/*[[".cells.staticTexts[\"Beispiel für eine AlertEN\"]",".staticTexts[\"Beispiel für eine AlertEN\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        let titelenAlert = app.alerts["TitelEN"]
        titelenAlert.staticTexts["TitelEN"].tap()
        titelenAlert.staticTexts["NachrichtEN"].tap()
        titelenAlert.buttons["KnopfEN"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Die Zellen wurden auch im Storyboard localisiert.EN"]/*[[".cells.staticTexts[\"Die Zellen wurden auch im Storyboard localisiert.EN\"]",".staticTexts[\"Die Zellen wurden auch im Storyboard localisiert.EN\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Beispiel für eigenen SprachwechselEN"]/*[[".cells.staticTexts[\"Beispiel für eigenen SprachwechselEN\"]",".staticTexts[\"Beispiel für eigenen SprachwechselEN\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

    }
}
