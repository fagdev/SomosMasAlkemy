//
//  SignInResponse.swift
//  Somosmas
//
//  Created by Flavio Gomez on 06/10/2021.
//

import Foundation

struct SignInResponse : Decodable{
    
    let ok : Bool
    let token : String?
    let msg : String?
    
}
