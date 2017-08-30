//
//  UITextView+LocalizableUI.swift
//  Pods
//
//  Created by Philipp Weiß on 01.08.17.
//
//

import Foundation
import UIKit

extension UITextView {


    convenience init(frame: CGRect, textContainer: NSTextContainer?, localizedKey: String?) {
        self.init(frame: frame, textContainer: textContainer)

        self.localizedKey = localizedKey

        /// Add the Element to the LocalizationManager
        LocalizationManager.sharedInstance().add(localizable: self)
    }

    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()

        if let localizedKey = localizedKey {
            let localizedContent = LocalizationManager.localizedStringFor(localizedKey)
            text = localizedContent
        }
    }

}
