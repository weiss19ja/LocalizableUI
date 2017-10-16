//
//  UINavigationItemTests.swift
//  LocalizableUITests
//
//  Created by Jan Weiß on 15.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
import LocalizableUI

private enum Constants {
    static let sampleStringKey = "localized-key-1"
    static let sampleStringKey2 = "localized-key-2"
    static let localizedSampleStringEn = "Sample1"
    static let localizedSampleStringDe = "Test1"
    static let localizedSampleStringEn2 = "Sample2"
    static let localizedSampleStringDe2 = "Test2"
}

class UINavigationItemTests: BaseTestCase {
    
    func testLocalizableNavigationItem() {
        let navigationItem = UINavigationItem(localizedKey: Constants.sampleStringKey, backButtonKey: Constants.sampleStringKey2)
        XCTAssertEqual(navigationItem.title, Constants.localizedSampleStringEn)
        
        changeLanguage()
        XCTAssertEqual(navigationItem.title, Constants.localizedSampleStringDe)
    }
    
}
