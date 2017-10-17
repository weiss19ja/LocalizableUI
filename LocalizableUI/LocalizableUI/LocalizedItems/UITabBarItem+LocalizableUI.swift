//
//  UITabBarItem+LocalizableUI.swift
//  Pods
//
//  Created by Jan Weiß on 01.08.17.
//
//

import Foundation
import UIKit

private var AssociatedObjectPointer: UInt8 = 0

extension UITabBarItem: Localizable {
    
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
    
    public convenience init(localizedKey: String, image: UIImage?, tag: Int) {
        let localizedTitle = LocalizationManager.localizedStringFor(localizedKey)
        self.init(title: localizedTitle, image: image, tag: tag)
        self.localizedKey = localizedKey
    }
    
    public convenience init(localizedKey: String, image: UIImage?, selectedImage: UIImage?) {
        let localizedTitle = LocalizationManager.localizedStringFor(localizedKey)
        self.init(title: localizedTitle, image: image, selectedImage: selectedImage)
        self.localizedKey = localizedKey
    }
    
    /// Updates all subviews with their given localizedKeys
    public func updateLocalizedStrings() {
        if let localizedKey = localizedKey {
            title = LocalizationManager.localizedStringFor(localizedKey)
        }
    }
    
}
