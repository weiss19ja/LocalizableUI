//
//  UITableViewCellTests.swift
//  LocalizableUITests
//
//  Created by Philipp Weiß on 17.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
@testable import LocalizableUI

class UITableViewCellTests: BaseTestCase {

    func testUITableViewCell() {
        let tableViewCell = UITableViewCell(style: .subtitle, reuseIdentifier: nil, localizedKey: Constants.sampleStringKey, detailLocalizedKey: Constants.sampleStringKey2)

        XCTAssertEqual(tableViewCell.textLabel?.text, Constants.localizedSampleStringEn)
        XCTAssertEqual(tableViewCell.detailTextLabel?.text, Constants.localizedSampleStringEn2)

        changeLanguage()
        XCTAssertEqual(tableViewCell.textLabel?.text, Constants.localizedSampleStringDe)
        XCTAssertEqual(tableViewCell.detailTextLabel?.text, Constants.localizedSampleStringDe2)
    }

}
