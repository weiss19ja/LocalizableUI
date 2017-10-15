//
//  UIBarButtonItem+LocalizableUI.swift
//  Pods
//
//  Created by Jan Weiß on 01.08.17.
//
//

import Foundation
import UIKit

public extension UIBarButtonItem {
    
    public convenience init(localizedKey: String, style: UIBarButtonItemStyle, target: Any?, action: Selector?) {
        let localizedTitle = LocalizationManager.localizedStringFor(localizedKey)
        self.init(title: localizedTitle, style: style, target: target, action: action)
        self.localizedKey = localizedKey
    }
    
}
