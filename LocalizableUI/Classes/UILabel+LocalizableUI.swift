//
//  UILabel+LocalizableUI.swift
//  Pods
//
//  Created by Jan Weiß on 01.08.17.
//
//

import Foundation
import UIKit

extension UILabel: Localizable {
    
    /// Updates all subviews with their given localizedKeys
    internal func updateLocalizedStrings() {
        if let localizedKey = localizedKey {
            let localizedContent = LocalizationManager.localizedStringFor(localizedKey)
            text = localizedContent
        }
    }
    
}
