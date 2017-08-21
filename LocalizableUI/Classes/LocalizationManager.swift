//
//  LocalizationService.swift
//  Pods
//
//  Created by Jan Weiß on 01.08.17.
//
//

import Foundation

open class LocalizationManager {

    /// Singleton of the LocalizationManager
    static let sharedInstance = LocalizationManager()

    /// Weak storage of the Localizable Items
    private var weakHash = NSHashTable<AnyObject>(options: NSHashTableWeakMemory)

    /// private init for the singleton
    /// adding locale changed notification
    private init() {
        NotificationCenter.default.addObserver(self, selector: #selector(languageChanged), name: NSLocale.currentLocaleDidChangeNotification, object: nil)
    }

    /// removes the existing observers
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSLocale.currentLocaleDidChangeNotification, object: nil)
    }

    /// Called when the current locale changed.
    @objc private func languageChanged() {
        weakHash.allObjects.flatMap { $0 as? Localizable }.forEach { $0.updateLocalizedStrings() }
    }

    /// Method for adding new Localizable Elements to the LocalizationManager
    /// The Elements will be stored as WEAK
    ///
    /// - Parameter localizable: Localizable Element to add
    internal func add(localizable: Localizable) {
        weakHash.add(localizable)
    }

    // TODO: Add functionality for custom (in-app language change) localization

    /// Method to get the right Localization for a Key that is included in the localized.strings.
    /// USe this MEthod instead of the system method!
    ///
    /// - Parameters:
    ///   - key: key
    ///   - tableName: table name
    ///   - bundle: bundle name
    ///   - value: value -> default ""
    ///   - comment: comment -> default ""
    /// - Returns: The localized string
    static func localizedStringFor(_ key: String, tableName: String? = nil, bundle: Bundle = Bundle.main, value: String = "", comment: String = "") -> String {
        return NSLocalizedString(key, tableName: tableName, bundle: bundle, value: value, comment: comment)
    }
    
}

