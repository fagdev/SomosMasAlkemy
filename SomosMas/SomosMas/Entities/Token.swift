//
//  Token.swift
//  Somosmas
//
//  Created by Mario Angelillo on 07/10/2021.
//

import Foundation

struct Token {
    let token: String
    
    init(dto: LoginResponseDTO) {
        self.token = dto.token ?? ""
    }
}
