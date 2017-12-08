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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLanguageChangeForCustomView() {
        let mainStoryboard = UIStoryboard(name: Constants.mainStoryboardName, bundle: Bundle.main)
        let customViewViewController = mainStoryboard.instantiateViewController(withIdentifier: Constants.customViewStoryboardId)
        
        XCTAssertNotNil(customViewViewController)
        
        let customView = customViewViewController.view.subviews[0] as! CustomView
        
        XCTAssertEqual(customView.label.text, Constants.customViewLabelTextEn)
        
        try! LocalizationManager.sharedInstance.changeLanguage(languageCode: "de")
        
        XCTAssertEqual(customView.label.text, Constants.customViewLabelTextDe)
        
        try! LocalizationManager.sharedInstance.changeLanguage(languageCode: "en")
        
        XCTAssertEqual(customView.label.text, Constants.customViewLabelTextEn)
    }
    
}
