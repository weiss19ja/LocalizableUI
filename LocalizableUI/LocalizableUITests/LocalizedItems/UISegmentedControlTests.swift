//
//  UISegmentedControlTests.swift
//  LocalizableUITests
//
//  Created by Philipp Weiß on 17.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
@testable import LocalizableUI

class UISegmentedControlTests: BaseTestCase {

    func testUISegmentedControl() {
        let localizedString = String(format: "%@,%@", Constants.sampleStringKey, Constants.sampleStringKey2)
        let segmentedControl = UISegmentedControl(items: ["a", "b"], localizedKey: localizedString)

        XCTAssertEqual(segmentedControl.titleForSegment(at: 0), Constants.localizedSampleStringEn)
        XCTAssertEqual(segmentedControl.titleForSegment(at: 1), Constants.localizedSampleStringEn2)

        changeLanguage()

        XCTAssertEqual(segmentedControl.titleForSegment(at: 0), Constants.localizedSampleStringDe)
        XCTAssertEqual(segmentedControl.titleForSegment(at: 1), Constants.localizedSampleStringDe2)
    }

}
