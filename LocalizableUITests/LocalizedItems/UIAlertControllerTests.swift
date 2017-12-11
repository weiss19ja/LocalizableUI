//
//  UIAlertControllerTests.swift
//  LocalizableUITests
//
//  Created by Jan Weiß on 08.12.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest

class UIAlertControllerTests: BaseTestCase {
    
    func testAlertControllerLocalization() {
        let alertController = UIAlertController(localizedTitle: Constants.sampleStringKey,
                                                localizedMessage: Constants.sampleStringKey2,
                                                preferredStyle: .alert)
        
        let alertConfirmAction = UIAlertAction(localzedTitleKey: Constants.sampleStringKey, style: .default, handler: nil)
        alertController.addAction(alertConfirmAction)
        
        let presentingVC = UIViewController()
        presentingVC.present(alertController, animated: false, completion: nil)
        
        XCTAssertEqual(alertController.title, Constants.localizedSampleStringEn)
        XCTAssertEqual(alertController.message, Constants.localizedSampleStringEn2)
        XCTAssertEqual(alertController.actions[0].title, Constants.localizedSampleStringEn)
        
        alertController.dismiss(animated: false, completion: nil)
        
        changeLanguage(to: .defaultDE)
        
        presentingVC.present(alertController, animated: false, completion: nil)
        
        XCTAssertEqual(alertController.title, Constants.localizedSampleStringDE)
        XCTAssertEqual(alertController.message, Constants.localizedSampleStringDE2)
        XCTAssertEqual(alertController.actions[0].title, Constants.localizedSampleStringDE)
        
        alertController.dismiss(animated: false, completion: nil)
        
        changeLanguage(to: .custom)
        
        presentingVC.present(alertController, animated: false, completion: nil)
        
        XCTAssertEqual(alertController.title, Constants.localizedSampleStringCustom)
        XCTAssertEqual(alertController.message, Constants.localizedSampleStringCustom2)
        XCTAssertEqual(alertController.actions[0].title, Constants.localizedSampleStringCustom)
    }
    
}
