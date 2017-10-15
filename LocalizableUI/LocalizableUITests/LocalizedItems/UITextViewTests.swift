//
//  UITextViewTests.swift
//  LocalizableUITests
//
//  Created by Jan Weiß on 15.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
import LocalizableUI

private enum Constants {
    static let sampleStringKey = "localized-key-1"
    static let localizedSampleStringEn = "Sample1"
    static let localizedSampleStringDe = "Test1"
}

class UITextViewTests: BaseTestCase {
    
    func testLocalizableTextView() {
        let textView = UITextView(frame: CGRect.zero, textContainer: nil, localizedKey: Constants.sampleStringKey)
        XCTAssertEqual(textView.text, Constants.localizedSampleStringEn)
        
        changeLanguage()
        XCTAssertEqual(textView.text, Constants.localizedSampleStringDe)
    }
    
}
