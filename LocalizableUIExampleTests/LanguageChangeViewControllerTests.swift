//
//  LocalizableUIExampleTests.swift
//  LocalizableUIExampleTests
//
//  Created by Jan Weiß on 26.11.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest

@testable import LocalizableUI_Example

private enum Constants {
    static let storyBoardName = "Main"
    static let languageChangeViewControllerStoryBoardId = "LanguageChangeViewController"
    static let switchLabelTextEn = "Click to change language"
    static let switchLabelTextDe = "Deaktivieren zum SprachwechselEN"
    static let switchLabelLanguageChangeEn = "Language change between DE and ENEN"
    static let switchLabelLanguageChangeDe = "Language change between DE and ENDE"
}

class LanguageChangeViewControllerTests: XCTestCase {
    
    var languagedChangedViewController: LanguageChangeViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: Constants.storyBoardName, bundle: Bundle.main)
        languagedChangedViewController = storyboard.instantiateViewController(withIdentifier: Constants.languageChangeViewControllerStoryBoardId) as! LanguageChangeViewController
        languagedChangedViewController.loadView()
    }
    
    override func tearDown() {
        languagedChangedViewController = nil
        super.tearDown()
    }
    
    func testCustomLanguageChange() {
        XCTAssertEqual(languagedChangedViewController.languageChangeSwitchLabel.text, Constants.switchLabelTextEn)
        let languageSwitch = UISwitch()
        languagedChangedViewController.changeLanguage(languageSwitch)
        XCTAssertEqual(languagedChangedViewController.languageChangeSwitchLabel.text, Constants.switchLabelTextDe)
        languageSwitch.isOn = true
        languagedChangedViewController.changeLanguage(languageSwitch)
        XCTAssertEqual(languagedChangedViewController.languageChangeSwitchLabel.text, Constants.switchLabelTextEn)
    }
    
    func testLanguageChange() {
        XCTAssertEqual(languagedChangedViewController.languageChangeEnToDeSwitchLabel.text, Constants.switchLabelLanguageChangeEn)
        let languageSwitch = UISwitch()
        languageSwitch.isOn = true
        languagedChangedViewController.changeLanguageLocalized(languageSwitch)
        XCTAssertEqual(languagedChangedViewController.languageChangeEnToDeSwitchLabel.text, Constants.switchLabelLanguageChangeDe)
        languageSwitch.isOn = false
        languagedChangedViewController.changeLanguageLocalized(languageSwitch)
        XCTAssertEqual(languagedChangedViewController.languageChangeEnToDeSwitchLabel.text, Constants.switchLabelLanguageChangeEn)
    }
}
