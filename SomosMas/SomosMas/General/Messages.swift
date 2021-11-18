//
//  Messages.swift
//  SomosMas
//
//  Created by Kenyi Rodriguez on 27/09/21.
//

import Foundation

struct Messages {
    struct Error {
        static var parse: String { "No se pudo leer la respuesta del servicio" }
        static var apiError: String { "Ha ocurrido un error obteniendo la información" }
    }

}

extension Messages {
    
    struct Login {
        static var userNotFound: String { NSLocalizedString("login.userNotFound", comment: "") }
    }
}
