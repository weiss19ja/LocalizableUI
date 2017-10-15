//
//  UIViewControllerTests.swift
//  LocalizableUI_Tests
//
//  Created by Jan Weiß on 12.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
import LocalizableUI

private enum Constants {
    static let testViewControllerNibName = "SampleViewController"
    static let viewControllerLocalizedTitleKey = "localized-key-1"
    static let viewControllerLocalizedBackButtonKey = "localized-key-2"
}

class UIViewControllerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: type(of: self))
        try! LocalizationManager.sharedInstance().changeLanguage(to: nil, from: bundle)
    }
    
    func testViewControllerInitialization() {
        let bundle = Bundle(for: type(of: self))
        let viewController = UIViewController(nibName: Constants.testViewControllerNibName,
                                              bundle: bundle,
                                              localizedTitleKey: Constants.viewControllerLocalizedTitleKey,
                                              localizedBackButtonKey: Constants.viewControllerLocalizedBackButtonKey)
        
        XCTAssertEqual(viewController.title, "Sample1")
    }
    
    func testViewControllerLanguageChanged() {
        let bundle = Bundle(for: type(of: self))
        let viewController = UIViewController(nibName: Constants.testViewControllerNibName,
                                              bundle: bundle,
                                              localizedTitleKey: Constants.viewControllerLocalizedTitleKey,
                                              localizedBackButtonKey: Constants.viewControllerLocalizedBackButtonKey)
        
        XCTAssertEqual(viewController.title, "Sample1")
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let viewController2 = UIViewController(nibName: Constants.testViewControllerNibName,
                                              bundle: bundle,
                                              localizedTitleKey: Constants.viewControllerLocalizedTitleKey)
        
        navigationController.pushViewController(viewController2, animated: false)
        
        XCTAssertEqual(navigationController.visibleViewController?.title, "Sample1")
        XCTAssertEqual(navigationController.navigationBar.backItem?.backBarButtonItem?.title, "Sample2")
        
        try! LocalizationManager.sharedInstance().changeLanguage(to: "CustomLocalizable", from: bundle)
        
        XCTAssertEqual(viewController.title, "Test1")
        XCTAssertEqual(viewController2.title, "Test1")
        XCTAssertEqual(navigationController.navigationBar.backItem?.backBarButtonItem?.title, "Test2")
    }
    
    func testViewControllerLanguageChangedWithCustomBackButtons() {
        let bundle = Bundle(for: type(of: self))
        let viewController = UIViewController(nibName: Constants.testViewControllerNibName,
                                              bundle: bundle,
                                              localizedTitleKey: Constants.viewControllerLocalizedTitleKey,
                                              localizedBackButtonKey: Constants.viewControllerLocalizedBackButtonKey)
        
        XCTAssertEqual(viewController.title, "Sample1")
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let viewController2 = UIViewController(nibName: Constants.testViewControllerNibName,
                                               bundle: bundle,
                                               localizedTitleKey: Constants.viewControllerLocalizedTitleKey,
                                               localizedBackButtonKey: Constants.viewControllerLocalizedBackButtonKey)
        
        navigationController.pushViewController(viewController2, animated: false)
        
        XCTAssertEqual(navigationController.visibleViewController?.title, "Sample1")
        XCTAssertEqual(navigationController.navigationBar.backItem?.backBarButtonItem?.title, "Sample2")
        
        try! LocalizationManager.sharedInstance().changeLanguage(to: "CustomLocalizable", from: bundle)
        
        XCTAssertEqual(viewController.title, "Test1")
        XCTAssertEqual(viewController2.title, "Test1")
        XCTAssertEqual(navigationController.navigationBar.backItem?.backBarButtonItem?.title, "Test2")
    }
    
}
