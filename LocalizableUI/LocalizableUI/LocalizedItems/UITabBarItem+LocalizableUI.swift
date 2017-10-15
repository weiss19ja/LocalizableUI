//
//  UITabBarItem+LocalizableUI.swift
//  Pods
//
//  Created by Jan Weiß on 01.08.17.
//
//

import Foundation
import UIKit

public extension UITabBarItem {
    
    public convenience init(localizedKey: String, image: UIImage?, tag: Int) {
        let localizedTitle = LocalizationManager.localizedStringFor(localizedKey)
        self.init(title: localizedTitle, image: image, tag: tag)
        self.localizedKey = localizedKey
    }
    
    public convenience init(localizedKey: String, image: UIImage?, selectedImage: UIImage?) {
        let localizedTitle = LocalizationManager.localizedStringFor(localizedKey)
        self.init(title: localizedTitle, image: image, selectedImage: selectedImage)
        self.localizedKey = localizedKey
    }
    
}
