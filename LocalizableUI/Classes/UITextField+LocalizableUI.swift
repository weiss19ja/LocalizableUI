//
//  UITextField+LocalizableUI.swift
//  Pods
//
//  Created by Jan Weiß on 01.08.17.
//
//

import Foundation
import UIKit

private var AssociatedObjectPointer: UInt8 = 0

extension UITextField {
    
    // Stores the property of the localized placeholder key
    @IBInspectable var localizedPlaceholderKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectPointer) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectPointer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateLocalizedStrings()

            /// Add the Element to the LocalizationManager
            LocalizationManager.sharedInstance.add(localizable: self)
        }
    }
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
        if let localizedKey = localizedKey {
            text = LocalizationManager.localizedStringFor(localizedKey)
        }
        
        if let localizedPlaceHolderKey = localizedPlaceholderKey {
            placeholder = LocalizationManager.localizedStringFor(localizedPlaceHolderKey)
        }
    }
    
}
