//
//  Members.swift
//  Somosmas
//
//  Created by Artekium on 27/10/2021.
//

import Foundation

struct Member {
    let id: Int
    let name: String
    let image: String
    let description: String
    let facebookUrl: String
    let linkedinUrl: String
    
    init(dto: MemberDTO) {
        self.id = dto.id ?? 0
        self.name = dto.name ?? ""
        self.image = dto.image ?? ""
        self.description = dto.description ?? ""
        self.facebookUrl = dto.facebookUrl ?? ""
        self.linkedinUrl = dto.linkedinUrl ?? ""
    }
}
