//
//  TextFieldTests.swift
//  LocalizableUITests
//
//  Created by Jan Weiß on 17.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
@testable import LocalizableUI

class TextFieldTests: BaseTestCase {
    
    func testTextField() {
        let textField = UITextField(frame: CGRect.zero,
                                    localizedKey: Constants.sampleStringKey,
                                    localizedPlaceholderKey: Constants.sampleStringKey2)
        
        XCTAssertEqual(textField.text, Constants.localizedSampleStringEn)
        XCTAssertEqual(textField.placeholder, Constants.localizedSampleStringEn2)
        
        changeLanguage()
        
        XCTAssertEqual(textField.text, Constants.localizedSampleStringDe)
        XCTAssertEqual(textField.placeholder, Constants.localizedSampleStringDe2)
    }
    
}
