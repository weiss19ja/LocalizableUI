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
    
    func testLanguageChange() {
        XCTAssertEqual(languagedChangedViewController.languageChangeSwitchLabel.text, Constants.switchLabelTextEn)
        let languageSwitch = UISwitch()
        languagedChangedViewController.changeLanguage(languageSwitch)
        XCTAssertEqual(languagedChangedViewController.languageChangeSwitchLabel.text, Constants.switchLabelTextDe)
        languageSwitch.isOn = true
        languagedChangedViewController.changeLanguage(languageSwitch)
        XCTAssertEqual(languagedChangedViewController.languageChangeSwitchLabel.text, Constants.switchLabelTextEn)
    }
}
