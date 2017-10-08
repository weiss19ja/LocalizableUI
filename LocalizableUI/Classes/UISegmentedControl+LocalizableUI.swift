//
//  UISegmentedControl+LocalizableUI.swift
//  Pods
//
//  Created by Jan Weiß on 30.08.17.
//
//

import Foundation

extension UISegmentedControl: Localizable {
    
    public convenience init(items: [Any]?, localizedKey: String?) {
        self.init(items: items)
        self.localizedKey = localizedKey
    }
    
    /// Updates all subviews with their given localizedKeys
    internal func updateLocalizedStrings() {
        if let localizedKeys = localizedKey {
            let keys = localizedKeys.components(separatedBy: ",")
            for (index, key) in keys.enumerated() {
                if index < numberOfSegments {
                    setTitle(LocalizationManager.localizedStringFor(key), forSegmentAt: index)
                }
            }
        }
    }
    
}
