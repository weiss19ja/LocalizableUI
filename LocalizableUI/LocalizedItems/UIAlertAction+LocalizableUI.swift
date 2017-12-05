//
//  UIAlertAction.swift
//  LocalizableUI
//
//  Created by Philipp Weiß on 23.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import Foundation

// Since the title is get only it is not possible to change the button text live nor to implement Localizable ... :(
extension UIAlertAction {

    public convenience init(localzedTitleKey: String, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)? ) {

        let title = LocalizationManager.localizedStringFor(localzedTitleKey)

        self.init(title: title, style: style, handler: handler)
    }
}
