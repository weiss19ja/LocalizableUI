//
//  BaseTestCase.swift
//  LocalizableUITests
//
//  Created by Jan Weiß on 15.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
import LocalizableUI

public enum Constants {
    static let sampleStringKey = "localized-key-1"
    static let sampleStringKey2 = "localized-key-2"
    static let localizedSampleStringEn = "Sample1"
    static let localizedSampleStringDe = "Test1"
    static let localizedSampleStringEn2 = "Sample2"
    static let localizedSampleStringDe2 = "Test2"
}

class BaseTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: type(of: self))
        try! LocalizationManager.sharedInstance.changeLanguage(to: nil, from: bundle)
    }
    
    func changeLanguage() {
        try! LocalizationManager.sharedInstance.changeLanguage(to: "CustomLocalizable", from: Bundle(for: type(of: self)))
    }
    
}
