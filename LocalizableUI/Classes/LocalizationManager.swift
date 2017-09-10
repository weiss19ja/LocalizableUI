//
//  LocalizationManager.swift
//  Pods
//
//  Created by Jan Weiß on 01.08.17.
//
//

import Foundation

open class LocalizationManager {

    /// The shared manager instance
    private static var _localizationManager: LocalizationManager!
    
    /// Singleton of the LocalizationManager
    public static func sharedInstance() -> LocalizationManager {
        if _localizationManager == nil {
            _localizationManager = LocalizationManager()
        }
        return _localizationManager
    }

    /// Weak storage of the Localizable Items
    private var weakHash = NSHashTable<AnyObject>(options: NSHashTableWeakMemory)
    
    /// The string table to search for localized values
    private var tableName: String?

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
    
    /// Changes the language to a custom one.
    /// Use this mehtod to provide a language change independently from the system one.
    /// It also sets the tableName to the custom one. If the tableName is nil the Localizable.strings is used.
    ///
    /// - Parameters:
    ///   - tableName: The custom tableName or the default one if nil is passed
    ///   - bundle: Optional Parameter. The bundle which contains the strings table or uses the main bundle if none is passed
    /// - Throws: A `LocalizableError` if the string table does not exist
    public func changeLanguage(to tableName: String?, from bundle: Bundle = Bundle.main) throws {
        guard let filePath = bundle.path(forResource: tableName, ofType: "strings"),
            FileManager.default.fileExists(atPath: filePath) == true else {
                
                throw LocalizableError.languageFileNotFound
        }
        
        self.tableName = tableName
        weakHash.allObjects.flatMap { $0 as? Localizable}.forEach { $0.updateLocalizedStrings() }
    }

    /// Method to get the right Localization for a Key that is included in the localized.strings.
    /// Use this Method instead of the system method!
    ///
    /// - Parameters:
    ///   - key: key
    ///   - bundle: bundle name
    ///   - value: value -> default ""
    ///   - comment: comment -> default ""
    /// - Returns: The localized string
    static func localizedStringFor(_ key: String, bundle: Bundle = Bundle.main, value: String = "", comment: String = "") -> String {
        let tableName = _localizationManager?.tableName
        return NSLocalizedString(key, tableName: tableName, bundle: bundle, value: value, comment: comment)
    }
    
}