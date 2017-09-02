//
//  UILabel+LocalizableUI.swift
//  Pods
//
//  Created by Jan Weiß on 01.08.17.
//
//

import Foundation
import UIKit

extension UILabel {
    
    /// Updates all subviews with their given localizedKeys
    override internal func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        if let localizedKey = localizedKey {
            let localizedContent = LocalizationManager.localizedStringFor(localizedKey)
            text = localizedContent
        }
    }
    
}
