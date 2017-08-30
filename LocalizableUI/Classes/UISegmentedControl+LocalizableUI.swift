//
//  UISegmentedControl+LocalizableUI.swift
//  Pods
//
//  Created by Jan Weiß on 30.08.17.
//
//

import Foundation

extension UISegmentedControl {
    
    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()
        
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
