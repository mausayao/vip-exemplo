//
//  Extensions.swift
//  VipExemplo
//
//  Created by Maurício Sayão on 02/08/21.
//

import UIKit

extension UIViewController {
    func showError(with message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: nil
        )
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
