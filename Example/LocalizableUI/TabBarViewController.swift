//
//  TabBarViewController.swift
//  LocalizableUI
//
//  Created by Jan Weiß on 01.09.17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class TabBarViewController: UIViewController {
    
    @IBAction func CancelClicked(_ sender: Any) {
        self.view.localizedKey = ""
        tabBarController?.dismiss(animated: true, completion: nil)
    }
    
}
