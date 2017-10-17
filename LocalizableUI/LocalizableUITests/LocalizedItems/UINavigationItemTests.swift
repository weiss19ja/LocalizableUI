//
//  UINavigationItemTests.swift
//  LocalizableUITests
//
//  Created by Jan Weiß on 15.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
import LocalizableUI

class UINavigationItemTests: BaseTestCase {
    
    func testLocalizableNavigationItem() {
        let navigationItem = UINavigationItem(localizedKey: Constants.sampleStringKey, backButtonKey: Constants.sampleStringKey2)
        XCTAssertEqual(navigationItem.title, Constants.localizedSampleStringEn)
        
        changeLanguage()
        XCTAssertEqual(navigationItem.title, Constants.localizedSampleStringDe)
    }
    
}
