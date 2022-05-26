//
//  UIUtils.swift
//  GitHubExplorer
//
//  Created by Nikola Shopov on 26.05.22.
//

import Foundation
import UIKit

public class UIUtils {
    static func showError(_ window: UIViewController, _ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
        }))
        window.present(alert, animated: true, completion: nil)
    }
}
