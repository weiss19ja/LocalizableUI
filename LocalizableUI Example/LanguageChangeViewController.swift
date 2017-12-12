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

    /// An Example how to use the LocalizationManager to get a simple string by any localized key
    ///
    /// - Returns: Localized String
    func loadLocalizedText() -> String {
        let localizedText = LocalizationManager.localizedStringFor("example-language-changed-localized")
        return localizedText
    }

    /// An Example how to use the LocalizationManager with a custom Bundle to get a simple string by any localized key
    ///
    /// - Returns: Localized String
    func loadLocalizedTextFromDifferentBundle(bundle: Bundle) -> String {
        let localizedText = LocalizationManager.localizedStringFor("example-language-changed-localized", bundle: bundle, value: "", comment: "")
        return localizedText
    }

    /// An Example how to use the LocalizationManager with the string extension
    ///
    /// - Returns: Localized String
    func loadLocalizedTextStringExtension() -> String {
        let localizedText = "example-language-changed-localized".localized
        return localizedText
    }
}
