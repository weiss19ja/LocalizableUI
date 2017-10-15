//
//  UIView+LocalizableUI.swift
//  Pods
//
//  Created by Jan Weiß on 01.08.17.
//
//

import Foundation
import UIKit

private var AssociatedObjectPointer: UInt8 = 0

public extension UIView {
    
    // Stores the property of the localized key
    @IBInspectable public var localizedKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectPointer) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectPointer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            if let localizableSelf = self as? Localizable {
                localizableSelf.updateLocalizedStrings()
                
                // Add the Element to the LocalizationManager
                localizableSelf.addToManager()
            }
        }
    }
    
    public convenience init(localizedKey: String?) {
        self.init()
        self.localizedKey = localizedKey
    }
    
    public convenience init(frame: CGRect, localizedKey: String?) {
        self.init(frame: frame)
        self.localizedKey = localizedKey
    }
    
}
