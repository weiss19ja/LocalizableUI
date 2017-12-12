//
//  CustomViewTests.swift
//  LocalizableUIExampleTests
//
//  Created by Jan Weiß on 08.12.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
import LocalizableUI
@testable import LocalizableUI_Example

private enum Constants {
    static let customViewLabelTextEn = "My Custom View"
    static let customViewLabelTextDe = "My Custom ViewDE"
    static let customViewStoryboardId = "CustomViewViewController"
    static let mainStoryboardName = "Main"
}

class CustomViewTests: XCTestCase {
    
    func testLanguageChangeForCustomView() {
        let mainStoryboard = UIStoryboard(name: Constants.mainStoryboardName, bundle: Bundle.main)
        let customViewViewController = mainStoryboard.instantiateViewController(withIdentifier: Constants.customViewStoryboardId)
        
        XCTAssertNotNil(customViewViewController)
        
        let customView = customViewViewController.view.subviews[0] as! CustomView
        
        XCTAssertEqual(customView.label.text, Constants.customViewLabelTextEn)
        XCTAssertEqual(customView.labelOrganized.text, Constants.customViewLabelTextEn)
        
        try! LocalizationManager.sharedInstance.changeLanguage(languageCode: "de")
        
        XCTAssertEqual(customView.label.text, Constants.customViewLabelTextDe)
        XCTAssertEqual(customView.labelOrganized.text, Constants.customViewLabelTextDe)
        
        try! LocalizationManager.sharedInstance.changeLanguage(languageCode: "en")
        
        XCTAssertEqual(customView.label.text, Constants.customViewLabelTextEn)
        XCTAssertEqual(customView.labelOrganized.text, Constants.customViewLabelTextEn)
    }
    
}
