//
//  AlertMenu.swift
//  Somosmas
//
//  Created by Coti on 15/10/2021.
//

import UIKit

extension UIViewController {
    func showAlertWithTitle(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alertController, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                alertController.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func showAlertWithTitleRetry(_ title: String, message: String, handler: @escaping () -> Void) {
        let action = UIAlertAction(title: "Retry", style: .default){
            UIAlertAction in
            handler()
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        self.present(alertController, animated: true){}
        alertController.addAction(action)
    }
}


