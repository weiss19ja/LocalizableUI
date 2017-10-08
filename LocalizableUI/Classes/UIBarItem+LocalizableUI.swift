//
//  UIBarItem+LocalizableUI.swift
//  Pods
//
//  Created by Jan Weiß on 01.08.17.
//
//

import Foundation
import UIKit

private var AssociatedObjectPointer: UInt8 = 0

extension UIBarItem: Localizable {
    
    // Stores the property of the localized key
    @IBInspectable var localizedKey: String? {
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
    
    public convenience init(localizedKey: String?) {
        self.init()
        self.localizedKey = localizedKey
    }
    
    public convenience init?(coder aDecoder: NSCoder, localizedKey: String?) {
        self.init(coder: aDecoder)
        self.localizedKey = localizedKey
    }
    
    /// Updates all subviews with their given localizedKeys
    func updateLocalizedStrings() {
        if let localizedKey = localizedKey {
            title = LocalizationManager.localizedStringFor(localizedKey)
        }
        
        
    }
    
}
