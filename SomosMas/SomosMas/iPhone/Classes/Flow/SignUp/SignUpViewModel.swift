//
//  SignUpViewModel.swift
//  Somosmas
//
//  Created by Artekium on 29/09/2021.
//

import Foundation

struct SignUpViewModel {
    
    var startRequest = {() -> Void in }
    var endRequest = {() -> Void in }
    var genericError = {(_ errorMessage: String) -> Void in }
    var createNewUser = {(_ userSession: UserSession) -> Void in }
    
    func createNewUser(name: String, email: String, password1: String, password2: String){
        
        if !validateFields(name: name, email: email, password1: password1, password2: password2) {
            self.genericError("Campos invalidos o incompletos")
        } else {
            if !password2.passwordsMatches(password1, password2) {
                self.genericError("Contraseñas desiguales")
            } else {
                // FUNC TO CREATE A NEW USER
                let User = NewUser(name: name, email: email, password: password1)
                createUser(Data: User)
            }
        }
    }
    
    func validateFields(name: String, email: String, password1: String, password2: String) -> Bool {
        let fieldsValidated = name.isEmpty || email.isValidEmail || password1.isEmpty || password2.isEmpty
        return fieldsValidated
    }
    
    func createUser(Data: NewUser) {
        self.startRequest()
                
        OngProvider.shared.registerUser(newUser: Data) { user in
            
            self.endRequest()
            if !user.ok {
                self.genericError("Ya existe una cuenta con este correo")
                return
            } else {
                let userToken = user.token
                let session = UserSession.buildWithToken(userToken ?? "")
                self.createNewUser(session)
            }
            
        } failure: { error in
            self.endRequest()
            self.genericError("Hubo un error al crear el usuario")
        }
    }
}
