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
    @IBInspectable public var localizedTitleKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectPointerTitle) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectPointerTitle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateLocalizedStrings()
            
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
    
    /// Convenience init for a new `UIViewController` with a 
    /// localized title and back button key
    ///
    /// - Parameters:
    ///   - nibName: The name of the nib file to associate with
    ///              the view controller. The nib file name should 
    ///              not contain any leading path information. If 
    ///              you specify nil, the nibName property is set to nil.
    ///   - bundle: The bundle in which to search for the nib file.
    ///             This method looks for the nib file in the bundle's
    ///             language-specific project directories first, 
    ///             followed by the Resources directory. If this
    ///             parameter is nil, the method uses the heuristics
    ///             described below to locate the nib file.
    ///   - localizedTitleKey: The localized key for the view 
    ///                        controllers title
    ///   - localizedBackButtonKey: The localized key for the 
    ///                             view controllers back button
    public convenience init(nibName: String?, bundle: Bundle?, localizedTitleKey: String? = nil, localizedBackButtonKey: String? = nil) {
        self.init(nibName: nibName, bundle: bundle)
        self.localizedTitleKey = localizedTitleKey
        self.localizedBackButtonKey = localizedBackButtonKey
    }

    /// Updates all subviews with their given localizedKeys
    internal func updateLocalizedStrings() {
        if let localizedKey = localizedTitleKey {
            let localizedContent = LocalizationManager.localizedStringFor(localizedKey)
            title = localizedContent
        }

        if let localizedKey = localizedBackButtonKey {
            let localizedContent = LocalizationManager.localizedStringFor(localizedKey)
            let backButton = UIBarButtonItem(localizedKey: localizedContent, style: .plain, target: nil, action: nil)
            navigationItem.backBarButtonItem = backButton
        }
    }
    
}
