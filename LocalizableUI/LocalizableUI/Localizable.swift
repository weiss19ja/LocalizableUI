//
//  Localizable.swift
//  Pods
//
//  Created by Philipp Weiß on 21.08.17.
//
//

import Foundation

public protocol Localizable: AnyObject {
    
    /// Updates the localized strings of the object
    func updateLocalizedStrings()
    
}

public extension Localizable {
    
    /// Adds the Element itself to the LocalizationManager
    func addToManager() {
        LocalizationManager.sharedInstance.add(localizable: self)
    }
    
}
