//
//  UITabBarItem+LocalizableUI.swift
//  Pods
//
//  Created by Jan Weiß on 01.08.17.
//
//

import Foundation
import UIKit

extension UITabBarItem {
    
    convenience init(localizedKey: String, image: UIImage?, tag: Int) {
        let localizedTitle = LocalizationService.localizedStringFor(localizedKey)
        self.init(title: localizedTitle, image: image, tag: tag)
        self.localizedKey = localizedKey
    }
    
    convenience init(localizedKey: String, image: UIImage?, selectedImage: UIImage?) {
        let localizedTitle = LocalizationService.localizedStringFor(localizedKey)
        self.init(title: localizedTitle, image: image, selectedImage: selectedImage)
        self.localizedKey = localizedKey
    }
    
}
