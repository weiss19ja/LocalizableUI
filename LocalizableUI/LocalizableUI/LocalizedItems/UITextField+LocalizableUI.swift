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

extension UITextField: Localizable {
    
    // Stores the property of the localized placeholder key
    @IBInspectable public var localizedPlaceholderKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectPointer) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectPointer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateLocalizedStrings()
            
            // Add the Element to the LocalizationManager
            addToManager()
        }
    }
    
    public convenience init(frame: CGRect, localizedKey: String?, localizedPlaceholderKey: String?) {
        self.init(frame: frame)
        self.localizedKey = localizedKey
        self.localizedPlaceholderKey = localizedPlaceholderKey
    }
    
    /// Updates all subviews with their given localizedKeys
    public func updateLocalizedStrings() {
        
        if let localizedKey = localizedKey {
            text = LocalizationManager.localizedStringFor(localizedKey)
        }
        
        if let localizedPlaceHolderKey = localizedPlaceholderKey {
            placeholder = LocalizationManager.localizedStringFor(localizedPlaceHolderKey)
        }
    }
    
}
