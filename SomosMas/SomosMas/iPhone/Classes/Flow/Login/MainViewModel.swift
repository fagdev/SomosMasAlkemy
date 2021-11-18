//
//  MainViewModel.swift
//  Somosmas
//
//  Created by Nahuel Paez on 05/10/2021.
//

import UIKit

class MainViewModel : UIViewController{

    var startRequest = {() -> Void in }
    var newUserSession = {(_ userSession: UserSession) -> Void in }
    var endRequest = {() -> Void in }
    var genericError = {(_ errorMessage: String) -> Void in }
    var showUserError = {(_ showError: Bool) -> Void in }
    var showPasswordError = {(_ showError: Bool) -> Void in }
    
    func statusByLogin(user: User){

        self.showUserError(false)
        self.showPasswordError(false)
        
        guard let email = user.email, email.count != 0 else {
            self.showUserError(true)
            return
        }
        
        guard let password = user.password, password.count != 0 else {
            self.showPasswordError(true)
            return
        }
        
        self.startRequest()

        LoginService().login(user: user) { token  in
            
            self.endRequest()
            let session = UserSession.buildWithToken(token)
            self.newUserSession(session)
            print("success token saved \(token)")
        
        } errorHandler: { errorMessage in
            
            self.endRequest()
            self.genericError(errorMessage)
        }
    }
}
