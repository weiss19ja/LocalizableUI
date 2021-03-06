//
//  UITableViewCell+LocalizableUI.swift
//  Pods
//
//  Created by Jan Weiß on 31.08.17.
//
//

import Foundation

private var associatedDetailObjectPointer: UInt8 = 0

extension UITableViewCell: Localizable {
    
    // Stores the property of the detail label text
    @IBInspectable var detailLocalizedKey: String? {
        get {
            return objc_getAssociatedObject(self, &associatedDetailObjectPointer) as? String
        }
        set {
            objc_setAssociatedObject(self, &associatedDetailObjectPointer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            // Add the Element to the LocalizationManager
            addToManager()
        }
    }
    
    public convenience init(style: UITableViewCellStyle, reuseIdentifier: String?, localizedKey: String?, detailLocalizedKey: String?) {
        self.init(style: style, reuseIdentifier: reuseIdentifier)
        self.localizedKey = localizedKey
        self.detailLocalizedKey = detailLocalizedKey
    }
    
    /// Updates all subviews with their given localizedKeys
    public func updateLocalizedStrings() {
        if let localizedKey = localizedKey {
            textLabel?.text = LocalizationManager.localizedStringFor(localizedKey)
        }
        
        if let detailLocalizedKey = detailLocalizedKey {
            detailTextLabel?.text = LocalizationManager.localizedStringFor(detailLocalizedKey)
        }
    }
    
}
