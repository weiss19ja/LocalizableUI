//
//  ExampleViewControllerTests.swift
//  LocalizableUIExampleTests
//
//  Created by Jan Weiß on 08.12.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest
import LocalizableUI
@testable import LocalizableUI_Example

private enum Constants {
    static let exampleViewControllerStoryboardId = "ExampleViewController"
    static let mainStoryboardName = "Main"
}

class ExampleViewControllerTests: XCTestCase {
    
    func testLanguageChangeForCustomView() {
        let mainStoryboard = UIStoryboard(name: Constants.mainStoryboardName, bundle: Bundle.main)
        let exampleViewController = mainStoryboard.instantiateViewController(withIdentifier: Constants.exampleViewControllerStoryboardId) as! ExampleViewController
        
        let window = UIApplication.shared.delegate?.window!
        window?.rootViewController = exampleViewController
        
        exampleViewController.didSelectAlertButton(UIButton(type: .system))
        
        sleep(5)
        
        XCTAssertNotNil(exampleViewController.presentedViewController)
    }
    
}
