//
//  MembersDTO.swift
//  Somosmas
//
//  Created by Artekium on 27/10/2021.
//

import Foundation

struct MembersResultDTO: Decodable {
    let success: Bool?
    let data: MemberDTO?
    let message: String?
}

struct MemberDTO: Decodable {
    let id: Int?
    let name: String?
    let image: String?
    let description: String?
    let facebookUrl: String?
    let linkedinUrl: String?
}
