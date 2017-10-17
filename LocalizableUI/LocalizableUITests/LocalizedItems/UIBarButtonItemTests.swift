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

        XCTAssertEqual(barButtonItem.title, Constants.localizedSampleStringEn)

        changeLanguage()
        XCTAssertEqual(barButtonItem.title, Constants.localizedSampleStringDe)
    }

}
