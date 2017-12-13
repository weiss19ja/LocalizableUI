//
//  ExampleViewController.swift
//  LocalizableUI Example
//
//  Created by Philipp Weiß on 23.10.17.
//  Copyright © 2017 Jan Weiß, Philipp Weiß. All rights reserved.
//

import UIKit

private enum Constants {
    static let titleKey = "example-alert-title"
    static let messagekey = "example-alert-message"
    static let buttonKey = "example-alert-button"
}

class ExampleViewController: UITableViewController {

    @IBAction func didSelectAlertButton(_ sender: Any) {
        let alertController = UIAlertController(localizedTitle: Constants.titleKey, localizedMessage: Constants.messagekey, preferredStyle: .alert)

        let action = UIAlertAction(localizedTitleKey: Constants.buttonKey, style: .cancel, handler: nil)

        alertController.addAction(action)

        present(alertController, animated: true, completion: nil)
    }

}
