//
//  UINavigationItem+LocalizableUI.swift
//  Pods
//
//  Created by Philipp Weiß on 01.08.17.
//
//

import Foundation
import UIKit

private var AssociatedObjectPointerTitle: UInt8 = 0
private var AssociatedObjectPointerBackButton: UInt8 = 0

extension UINavigationItem: Localizable {

    // Stores the property of the localized key
    @IBInspectable public var localizedTitleKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectPointerTitle) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectPointerTitle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            // Add the Element to the LocalizationManager
            addToManager()
        }
    }

    // Stores the property of the localized key
    @IBInspectable public var localizedBackButtonKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectPointerBackButton) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectPointerBackButton, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateLocalizedStrings()
            
            // Add the Element to the LocalizationManager
            addToManager()
        }
    }
    
    public convenience init(localizedKey: String?, backButtonKey: String? = nil) {
        self.init()
        self.localizedTitleKey = localizedKey
        self.localizedBackButtonKey = backButtonKey
    }

    /// Updates all subviews with their given localizedKeys
    public func updateLocalizedStrings() {

        if let localizedKey = localizedTitleKey {
            let localizedContent = LocalizationManager.localizedStringFor(localizedKey)
            title = localizedContent
        }

        if let localizedKey = localizedBackButtonKey {
            let localizedContent = LocalizationManager.localizedStringFor(localizedKey)
            let backButton = UIBarButtonItem(localizedKey: localizedContent, style: .plain, target: nil, action: nil)
            backBarButtonItem = backButton
        }
    }
    
}
