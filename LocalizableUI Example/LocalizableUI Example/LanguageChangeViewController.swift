//
//  LanguageChangeViewController.swift
//  LocalizableUI
//
//  Created by Jan Weiß on 02.09.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import UIKit
import LocalizableUI

class LanguageChangeViewController: UIViewController {

    @IBAction func changeLanguage(_ sender: UISwitch) {
        if (sender.isOn) {
            try! LocalizationManager.sharedInstance.changeLanguage(to: nil)
        } else {
            try! LocalizationManager.sharedInstance.changeLanguage(to: "CustomLocalizable")
        }
    }
}
