//
//  UIButtonTests.swift
//  LocalizableUITests
//
//  Created by Philipp Weiß on 17.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
@testable import LocalizableUI

private enum Constants {
    static let sampleStringKey = "localized-key-1"
    static let sampleStringKey2 = "localized-key-2"
    static let localizedSampleStringEn = "Sample1"
    static let localizedSampleStringDe = "Test1"
    static let localizedSampleStringEn2 = "Sample2"
    static let localizedSampleStringDe2 = "Test2"
}

class UIButtonsTests: BaseTestCase {

    func testLocalizableUIButton() {
        let button = UIButton(type: .custom, localizedKey: Constants.sampleStringKey)
        XCTAssertEqual(button.titleLabel?.text, Constants.localizedSampleStringEn)

        changeLanguage()
        XCTAssertEqual(button.titleLabel?.text, Constants.localizedSampleStringDe)
    }

}
