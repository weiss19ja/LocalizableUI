//
//  Localizable.swift
//  Pods
//
//  Created by Philipp Weiß on 21.08.17.
//
//

import Foundation

protocol Localizable: AnyObject {
    
    /// Updates the localized strings of the object
    func updateLocalizedStrings()
    
}

extension Localizable {
    
    /// Adds the Element itself to the LocalizationManager
    func addToManager() {
        LocalizationManager.sharedInstance().add(localizable: self)
    }
    
}
