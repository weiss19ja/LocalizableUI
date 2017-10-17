//
//  UITabBarItemTests.swift
//  LocalizableUITests
//
//  Created by Philipp Weiß on 17.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
@testable import LocalizableUI

class UITabBarItemTests: BaseTestCase {

    func testUITabBarItem() {
        var tabBarItems = [UITabBarItem]()
        
        let tabBarItem = UITabBarItem(localizedKey: Constants.sampleStringKey)
        tabBarItems.append(tabBarItem)
        
        let tabBarItem2 = UITabBarItem(localizedKey: Constants.sampleStringKey, image: nil, tag: 1)
        tabBarItems.append(tabBarItem2)
        
        let tabBarItem3 = UITabBarItem(localizedKey: Constants.sampleStringKey, image: nil, selectedImage: nil)
        tabBarItems.append(tabBarItem3)
        
        for item in tabBarItems {
            XCTAssertEqual(item.title, Constants.localizedSampleStringEn)
        }
        
        changeLanguage()
        
        for item in tabBarItems {
            XCTAssertEqual(item.title, Constants.localizedSampleStringDe)
        }
    }
}
