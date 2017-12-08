//
//  TabBarViewControllerTests.swift
//  LocalizableUIExampleTests
//
//  Created by Jan Weiß on 26.11.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import XCTest

@testable import LocalizableUI_Example

private enum Constants {
    static let tabBarViewControllerStoryBoardId = "TabBarViewController"
    static let storyBoardName = "Main"
}

class TabBarViewControllerTests: XCTestCase {
    
    var viewControllerToTest:TabBarViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: Constants.storyBoardName, bundle: Bundle.main)
        viewControllerToTest = storyboard.instantiateViewController(withIdentifier: Constants.tabBarViewControllerStoryBoardId) as! TabBarViewController
        viewControllerToTest.loadView()
    }
    
    override func tearDown() {
        viewControllerToTest = nil
        super.tearDown()
    }
    
    func testCancelAction() {
        let sourceViewController = UIViewController()
        UIApplication.shared.delegate?.window!?.rootViewController = sourceViewController
        
        let tabBarViewController = UITabBarController()
        let navigationController = UINavigationController(rootViewController: viewControllerToTest)
        let secondTabViewController = UIViewController()
        tabBarViewController.setViewControllers([navigationController, secondTabViewController], animated: false)
        
        let navExpectation = expectation(description: "Wait for navigation finished")
        
        sourceViewController.present(tabBarViewController, animated: false) {
            XCTAssertNotNil(sourceViewController.presentedViewController)
            self.viewControllerToTest.CancelClicked(self.viewControllerToTest.navigationItem.leftBarButtonItem!)
            navExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
