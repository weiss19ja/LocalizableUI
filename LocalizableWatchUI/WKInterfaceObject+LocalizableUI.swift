//
//  WKInterfaceObject+LocalizableUI.swift
//  LocalizableWatchUI
//
//  Created by Jan Weiß on 13.12.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import WatchKit

private var AssociatedObjectPointer: UInt8 = 0

extension WKInterfaceObject {
    
    // Stores the property of the localized key
    @IBInspectable public var localizedKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectPointer) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectPointer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            if let localizableSelf = self as? Localizable {
                // Add the Element to the LocalizationManager
                localizableSelf.addToManager()
            }
        }
    }
    
    public convenience init(localizedKey: String) {
        self.init()
        self.localizedKey = localizedKey
    }
    
}
