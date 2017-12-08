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

    @IBOutlet weak var languageChangeSwitchLabel: UILabel!
    @IBOutlet weak var languageChangeEnToDeSwitchLabel: UILabel!
    
    @IBAction func changeLanguage(_ sender: UISwitch) {
        if (sender.isOn) {
            try! LocalizationManager.sharedInstance.changeLanguage(to: "Localizable")
        } else {
            try! LocalizationManager.sharedInstance.changeLanguage(to: "CustomLocalizable")
        }
    }

    @IBAction func changeLanguageLocalized(_ sender: UISwitch) {
        if (sender.isOn) {
            try! LocalizationManager.sharedInstance.changeLanguage(languageCode: "de")
        } else {
            try! LocalizationManager.sharedInstance.changeLanguage(languageCode:  "en")
        }
    }

}
