//
//  LoginResponseDTO.swift
//  Somosmas
//
//  Created by Mario Angelillo on 07/10/2021.
//

import Foundation

struct LoginResponseDTO: Decodable {
    
    let ok: Bool?
    let token: String?
    let msg: String?
    
}
