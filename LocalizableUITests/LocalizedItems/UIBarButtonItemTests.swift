//
//  UIBarButtonItemTests.swift
//  LocalizableUITests
//
//  Created by Philipp Weiß on 17.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
@testable import LocalizableUI

class UIBarButtonItemTests: BaseTestCase {

    func testUIBarButtonItem() {
        let barButtonItem = UIBarButtonItem(localizedKey: Constants.sampleStringKey, style: .plain, target: nil, action: nil)
        let barButtonItem2 = UIBarButtonItem(localizedKey: Constants.sampleStringKey2)

        XCTAssertEqual(barButtonItem.title, Constants.localizedSampleStringEn)
        XCTAssertEqual(barButtonItem2.title, Constants.localizedSampleStringEn2)

        changeLanguage(to: .custom)
        XCTAssertEqual(barButtonItem.title, Constants.localizedSampleStringCustom)
        XCTAssertEqual(barButtonItem2.title, Constants.localizedSampleStringCustom2)
    }

}
