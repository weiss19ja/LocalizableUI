//
//  LocalizationManager.swift
//  LocalizableUITests
//
//  Created by Jan Weiß on 15.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
@testable import LocalizableUI

class LocalizationManagerTests: BaseTestCase {
    
    func testChangeLanguageWithCustomBundle() {
        XCTAssertEqual(NSLocalizedString(Constants.sampleStringKey, bundle: Bundle(for: type(of: self)), comment: ""), Constants.localizedSampleStringEn)

        changeLanguage(to: .custom)
        XCTAssertEqual(NSLocalizedString(Constants.sampleStringKey, bundle: Bundle(for: type(of: self)), comment: ""), Constants.localizedSampleStringEn)
    }

    func testErrorLanguageChanged() {
        XCTAssertThrowsError(try LocalizationManager.sharedInstance.changeLanguage(to: "NotExistingStringTable"))
    }
    
    func testDeinitLocalizationManager() {
        LocalizationManager.clear()
    }

    func testWeakCount() {
        let uiManager = LocalizationManager.sharedInstance!

        autoreleasepool {
            XCTAssertEqual(uiManager.weakHash.allObjects.count, 0)
            var button: UIButton? = UIButton(type: .custom, localizedKey: Constants.sampleStringKey)
            _ = button?.tintColor // Hide warning
            XCTAssertEqual(uiManager.weakHash.allObjects.count, 1)

            button = nil
        }

        XCTAssertEqual(uiManager.weakHash.allObjects.count, 0)

        var button4: UIButton?

        autoreleasepool {
            XCTAssertEqual(uiManager.weakHash.allObjects.count, 0)
            var button1: UIButton? = UIButton(type: .custom, localizedKey: Constants.sampleStringKey)
            _ = button1?.tintColor // Hide warning
            XCTAssertEqual(uiManager.weakHash.allObjects.count, 1)
            var button2: UIButton? = UIButton(type: .custom, localizedKey: Constants.sampleStringKey)
            _ = button2?.tintColor // Hide warning
            XCTAssertEqual(uiManager.weakHash.allObjects.count, 2)
            var button3: UIButton? = UIButton(type: .custom, localizedKey: Constants.sampleStringKey)
            _ = button3?.tintColor // Hide warning
            XCTAssertEqual(uiManager.weakHash.allObjects.count, 3)
            button4 = UIButton(type: .custom, localizedKey: Constants.sampleStringKey)
            _ = button4?.tintColor // Hide warning
            XCTAssertEqual(uiManager.weakHash.allObjects.count, 4)

            button1 = nil
            button2 = nil
            button3 = nil
        }

        XCTAssertEqual(uiManager.weakHash.allObjects.count, 1)

    }
    
}
