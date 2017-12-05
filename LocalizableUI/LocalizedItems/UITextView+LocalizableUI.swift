//
//  UITextView+LocalizableUI.swift
//  Pods
//
//  Created by Philipp Weiß on 01.08.17.
//
//

import Foundation
import UIKit

extension UITextView: Localizable {

    /// Convenience init for a new text view with a frame, a textContainer
    /// and the localized key for the text
    ///
    /// - Parameters:
    ///   - frame: The frame rectangle of the text view.
    ///   - textContainer: The text container to use for the receiver (can be nil).
    ///   - localizedKey: The localized key for the text
    public convenience init(frame: CGRect, textContainer: NSTextContainer?, localizedKey: String?) {
        self.init(frame: frame, textContainer: textContainer)
        self.localizedKey = localizedKey
    }

    /// Updates all subviews with their given localizedKeys
    public func updateLocalizedStrings() {
        if let localizedKey = localizedKey {
            let localizedContent = LocalizationManager.localizedStringFor(localizedKey)
            text = localizedContent
        }
    }

}
