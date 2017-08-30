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
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        if let localizedKey = localizedKey {
            let localizedContent = LocalizationManager.localizedStringFor(localizedKey)
            text = localizedContent
        }
    }
    
}
