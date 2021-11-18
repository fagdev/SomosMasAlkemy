//
//  UserSesion.swift
//  Somosmas
//
//  Created by Flavio Gomez on 14/10/2021.
//

import Foundation

struct UserSession {
    
    static var sessionVerify: UserSession? {
        
        let userDefaults = UserDefaults.standard
        guard let token = userDefaults.object(forKey: "token") as? String else {
            print("entro por no tener token")
            return nil
        }
        return UserSession(token: token)
    }
    
    func closeSession() {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "token")
        userDefaults.synchronize()
        print("se elimino el token")
    }
    
    var token: String {
        let userDefaults = UserDefaults.standard
        let token = userDefaults.object(forKey: "token") as? String
        return token ?? ""
    }
    
    fileprivate init(token: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(token, forKey: "token")
        userDefaults.synchronize()
    }
}


extension UserSession {
    
    @discardableResult static func buildWithToken(_ token: String) -> UserSession {
        
        let session = UserSession(token: token)
        return session
    }
}
