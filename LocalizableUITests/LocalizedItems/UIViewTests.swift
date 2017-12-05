//
//  UIViewTests.swift
//  LocalizableUITests
//
//  Created by Jan Weiß on 17.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
@testable import LocalizableUI

class UIViewTests: BaseTestCase {
    
    func testViewContructors() {
        let view1 = UIView(localizedKey: Constants.sampleStringKey)
        XCTAssertEqual(view1.localizedKey, Constants.sampleStringKey)
        
        let view2 = UIView(frame: CGRect.zero, localizedKey: Constants.sampleStringKey2)
        XCTAssertEqual(view2.localizedKey, Constants.sampleStringKey2)
    }
    
}
