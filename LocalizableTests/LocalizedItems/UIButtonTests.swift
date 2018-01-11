//
//  UIButtonTests.swift
//  LocalizableUITests
//
//  Created by Philipp Weiß on 17.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
@testable import LocalizableUI

class UIButtonsTests: BaseTestCase {

    func testLocalizableUIButton() {
        let button = UIButton(type: .custom, localizedKey: Constants.sampleStringKey)
        XCTAssertEqual(button.titleLabel?.text, Constants.localizedSampleStringEn)

        changeLanguage(to: .custom)
        XCTAssertEqual(button.titleLabel?.text, Constants.localizedSampleStringCustom)
    }

}
