//
//  UIAlertController+LocalizableUI.swift
//  LocalizableUI
//
//  Created by Philipp Weiß on 23.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import UIKit

private var AssociatedObjectPointerLocalizable: UInt8 = 0
private var AssociatedObjectPointerMessage: UInt8 = 0

extension UIAlertController {

    // Stores the property of the localized key
    public var localizedMessageKey: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObjectPointerMessage) as? String
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectPointerMessage, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            updateLocalizedStrings()

            // Add the Element to the LocalizationManager
            addToManager()
        }
    }

    public convenience init(localizedTitle: String?, localizedMessage: String?, preferredStyle: UIAlertControllerStyle) {
        self.init(title: localizedTitle, message: localizedMessage, preferredStyle:preferredStyle)

        localizedTitleKey = localizedTitle
        localizedMessageKey = localizedMessage

        let localized = Localized(self)
        localized.addToManager()

        objc_setAssociatedObject(self, &AssociatedObjectPointerLocalizable, localized, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    class Localized: Localizable {

        weak var alertController: UIAlertController?

        init(_ alertController: UIAlertController) {
            self.alertController = alertController
        }

        func updateLocalizedStrings() {
            alertController?.title = LocalizationManager.localizedStringFor(alertController?.localizedTitleKey ?? "")
            alertController?.message = LocalizationManager.localizedStringFor(alertController?.localizedMessageKey ?? "")
        }
    }
}
