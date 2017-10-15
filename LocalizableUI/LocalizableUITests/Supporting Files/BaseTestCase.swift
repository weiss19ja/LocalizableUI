//
//  BaseTestCase.swift
//  LocalizableUITests
//
//  Created by Jan Weiß on 15.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
import LocalizableUI

class BaseTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: type(of: self))
        try! LocalizationManager.sharedInstance().changeLanguage(to: nil, from: bundle)
    }
    
    func changeLanguage() {
        try! LocalizationManager.sharedInstance().changeLanguage(to: "CustomLocalizable", from: Bundle(for: type(of: self)))
    }
    
}
