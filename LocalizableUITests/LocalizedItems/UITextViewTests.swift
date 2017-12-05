//
//  UITextViewTests.swift
//  LocalizableUITests
//
//  Created by Jan Weiß on 15.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
import LocalizableUI

class UITextViewTests: BaseTestCase {
    
    func testLocalizableTextView() {
        let textView = UITextView(frame: CGRect.zero, textContainer: nil, localizedKey: Constants.sampleStringKey)
        XCTAssertEqual(textView.text, Constants.localizedSampleStringEn)
        
        changeLanguage(to: .custom)
        XCTAssertEqual(textView.text, Constants.localizedSampleStringCustom)
    }
    
}
