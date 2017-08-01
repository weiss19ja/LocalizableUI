//
//  UIButton+LocalizableUI.swift
//  Pods
//
//  Created by Philipp Weiß on 01.08.17.
//
//

import Foundation
import UIKit

extension UIButton {

    override func updateLocalizedStrings() {
        super.updateLocalizedStrings()

        if let localizedKey = localizedKey {
            let localizedContent = LocalizationService.localizedStringFor(localizedKey)
            setTitle(localizedContent, for: .normal)
        }
    }

}
