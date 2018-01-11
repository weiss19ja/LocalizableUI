//
//  UILabelTests.swift
//  LocalizableUITests
//
//  Created by Philipp Weiß on 17.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
@testable import LocalizableUI

class UILabelTests: BaseTestCase {

    func testUILabel() {
        let label = UILabel(localizedKey: Constants.sampleStringKey)
        XCTAssertEqual(label.text, Constants.localizedSampleStringEn)

        changeLanguage(to: .custom)
        XCTAssertEqual(label.text, Constants.localizedSampleStringCustom)
    }

}
