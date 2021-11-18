//
//  Alerts.swift
//  Somosmas
//
//  Created by Nahuel Paez on 07/10/2021.
//

import UIKit

struct Alert{
    
     func loginFail(on vc: UIViewController, with message:String , title:String){
        let alert = UIAlertController(title : title , message:message ,preferredStyle: .alert) // config el error
              alert.addAction(UIAlertAction(title:" OK" , style: .destructive, handler:  nil)) // estilo del modal
               vc.present(alert, animated: true, completion: nil) // presenta
    }
    
    static func apiAlert(on vc: UIViewController, messegeBtn:String ,action: @escaping AlertAction) {
        let alert = UIAlertController(title: "Algo salió mal" , message: Messages.Error.apiError, preferredStyle: .alert)
        let action = UIAlertAction(title: messegeBtn , style: .default, handler: action)
        alert.addAction(action)
        vc.present(alert, animated: true)
    }
}
