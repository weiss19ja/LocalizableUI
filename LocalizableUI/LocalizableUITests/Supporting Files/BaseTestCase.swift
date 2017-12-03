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
    static let localizedSampleStringCustom = "Test1"
    static let localizedSampleStringEn2 = "Sample2"
    static let localizedSampleStringCustom2 = "Test2"
    static let localizedSampleStringDE = "Sample1DE"
    static let localizedSampleStringDE2 = "Sample2DE"
}

enum TestLanguages {
    case defaultEN, defaultDE
    case custom
}

class BaseTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: type(of: self))
        try! LocalizationManager.sharedInstance.changeLanguage(to: nil, from: bundle)
    }
    
    func changeLanguage(to testLanguages: TestLanguages) {

        switch testLanguages {
        case .custom:
            try! LocalizationManager.sharedInstance.changeLanguage(to: "CustomLocalizable", from: Bundle(for: type(of: self)), languageCode: nil)
        case .defaultDE:
            try! LocalizationManager.sharedInstance.changeLanguage(to: "Localizable", from: Bundle(for: type(of: self)), languageCode: "de")
        case .defaultEN:
            try! LocalizationManager.sharedInstance.changeLanguage(to: "Localizable", from: Bundle(for: type(of: self)), languageCode: "en")
        }
    }
}
