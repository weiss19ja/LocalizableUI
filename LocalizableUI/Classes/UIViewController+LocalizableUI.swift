//
//  UIViewController+LocalizableUI.swift
//  Pods
//
//  Created by Philipp Weiß on 01.08.17.
//
//

import Foundation
import UIKit

private var AssociatedObjectPointerTitle: UInt8 = 0
private var AssociatedObjectPointerBackButton: UInt8 = 0

extension UIViewController: Localizable {

    // Stores the property of the localized key
    @IBInspectable var localizedTitleKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectPointerTitle) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectPointerTitle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateLocalizedStrings()

            /// Add the Element to the LocalizationManager
            LocalizationManager.sharedInstance.add(localizable: self)
        }
    }

    // Stores the property of the localized key
    @IBInspectable var localizedBackButtonKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectPointerBackButton) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectPointerBackButton, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateLocalizedStrings()
        }
    }

    /// Updates all subviews with their given localizedKeys
    func updateLocalizedStrings() {

        if let localizedKey = localizedTitleKey {
            let localizedContent = LocalizationManager.localizedStringFor(localizedKey)
            title = localizedContent
        }

        if let localizedKey = localizedBackButtonKey {
            let localizedContent = LocalizationManager.localizedStringFor(localizedKey)
            navigationItem.backBarButtonItem?.title = LocalizationManager.localizedStringFor(localizedContent)
        }
    }
    
}
