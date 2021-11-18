//
//  Extensions.swift
//  Somosmas
//
//  Created by Artekium on 06/10/2021.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func passwordsMatches(_ password1: String, _ password2: String) -> Bool {
        let passwordRegEx = "^(?=.*?[a-z])(?=.*?[0-9]).{5,}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx).evaluate(with: password1)
        let passwordsEquals = password1.elementsEqual(password2)
        
        let validation = passwordsEquals && passwordPred
        return validation
    }
    
    var validPassword: Bool {
        let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let passPred = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        return passPred.evaluate(with: self)
    }
    
    var removeEspecialCharacters: String {
        let testStringReplacedOccurences = self.replacingOccurrences(of: "<p>",
                                                                     with: "").replacingOccurrences(of: "</p>", with: "")
        return testStringReplacedOccurences
    }
}

extension Data {
    func toDTO<Entity>(_ type: Entity.Type) -> Entity? where Entity: Decodable {
        return try? JSONDecoder().decode(type, from: self)
    }
}
