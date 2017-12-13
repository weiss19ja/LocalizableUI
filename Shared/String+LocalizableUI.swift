//
//  String+LocalizableUI.swift
//  LocalizableUI
//
//  Created by Philipp Weiß on 12.12.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import Foundation

extension String {

    /// helper to create a localized String from a Key
    public var localized: String {
        return LocalizationManager.localizedStringFor(self)
    }
}
