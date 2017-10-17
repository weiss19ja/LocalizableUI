//
//  UIViewControllerTests.swift
//  LocalizableUI_Tests
//
//  Created by Jan Weiß on 12.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
import LocalizableUI

private extension Constants {
    static let testViewControllerNibName = "SampleViewController"
}

class UIViewControllerTests: BaseTestCase {
    
    func testViewControllerInitialization() {
        let bundle = Bundle(for: type(of: self))
        let viewController = UIViewController(nibName: Constants.testViewControllerNibName,
                                              bundle: bundle,
                                              localizedTitleKey: Constants.sampleStringKey,
                                              localizedBackButtonKey: Constants.sampleStringKey2)
        
        XCTAssertEqual(viewController.title, Constants.localizedSampleStringEn)
    }
    
    func testViewControllerLanguageChanged() {
        let bundle = Bundle(for: type(of: self))
        let viewController = UIViewController(nibName: Constants.testViewControllerNibName,
                                              bundle: bundle,
                                              localizedTitleKey: Constants.sampleStringKey,
                                              localizedBackButtonKey: Constants.sampleStringKey2)
        
        XCTAssertEqual(viewController.title, Constants.localizedSampleStringEn)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let viewController2 = UIViewController(nibName: Constants.testViewControllerNibName,
                                              bundle: bundle,
                                              localizedTitleKey: Constants.sampleStringKey)
        
        navigationController.pushViewController(viewController2, animated: false)
        
        XCTAssertEqual(navigationController.visibleViewController?.title, Constants.localizedSampleStringEn)
        XCTAssertEqual(navigationController.navigationBar.backItem?.backBarButtonItem?.title, Constants.localizedSampleStringEn2)
        
        changeLanguage()
        
        XCTAssertEqual(viewController.title, Constants.localizedSampleStringDe)
        XCTAssertEqual(viewController2.title, Constants.localizedSampleStringDe)
        XCTAssertEqual(navigationController.navigationBar.backItem?.backBarButtonItem?.title, Constants.localizedSampleStringDe2)
    }
    
    func testViewControllerLanguageChangedWithCustomBackButtons() {
        let bundle = Bundle(for: type(of: self))
        let viewController = UIViewController(nibName: Constants.testViewControllerNibName,
                                              bundle: bundle,
                                              localizedTitleKey: Constants.sampleStringKey,
                                              localizedBackButtonKey: Constants.sampleStringKey2)
        
        XCTAssertEqual(viewController.title, Constants.localizedSampleStringEn)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let viewController2 = UIViewController(nibName: Constants.testViewControllerNibName,
                                               bundle: bundle,
                                               localizedTitleKey: Constants.sampleStringKey,
                                               localizedBackButtonKey: Constants.sampleStringKey2)
        
        navigationController.pushViewController(viewController2, animated: false)
        
        XCTAssertEqual(navigationController.visibleViewController?.title, Constants.localizedSampleStringEn)
        XCTAssertEqual(navigationController.navigationBar.backItem?.backBarButtonItem?.title, Constants.localizedSampleStringEn2)
        
        changeLanguage()
        
        XCTAssertEqual(viewController.title, Constants.localizedSampleStringDe)
        XCTAssertEqual(viewController2.title, Constants.localizedSampleStringDe)
        XCTAssertEqual(navigationController.navigationBar.backItem?.backBarButtonItem?.title, Constants.localizedSampleStringDe2)
    }
    
}
