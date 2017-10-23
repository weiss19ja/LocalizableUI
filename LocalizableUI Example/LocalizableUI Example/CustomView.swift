//
//  CustomView.swift
//  LocalizableUI Example
//
//  Created by Philipp Weiß on 23.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import UIKit
import LocalizableUI

private enum Constants {
    static let titleStringID = "example-customView-label"
}

/// Implementation of a custom view.
/// This file shows how to implement the Localizable protocol and how to add it to the LocalizationManager
class CustomView: UIView {

    let label = UILabel(frame: CGRect(x: 0, y: 50, width: 300, height: 50))

    required init(coder: NSCoder) {
        super.init(coder: coder)!

        addSubview(label)

        // add new Localizable to the manager
        addToManager()
    }
}


// MARK: - Implement Localizable
extension CustomView: Localizable {
    func updateLocalizedStrings() {
        label.text = LocalizationManager.localizedStringFor(Constants.titleStringID)
    }
}
