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

extension UIBarItem {
    
    // Stores the property of the localized key
    @IBInspectable var localizedKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectPointer) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectPointer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateLocalizedStrings()
        }
    }
    
    convenience init(localizedKey: String?) {
        self.init()
        self.localizedKey = localizedKey
    }
    
    func updateLocalizedStrings() {
        if let localizedKey = localizedKey {
            title = LocalizationService.localizedStringFor(localizedKey)
        }
    }
    
}
