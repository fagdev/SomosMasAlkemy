//
//  AboutUsDTO.swift
//  Somosmas
//
//  Created by Lucas Di Lorenzo on 28/10/2021.
//

import Foundation
struct AboutResultDTO: Decodable {
    let success: Bool?
    let data: [AboutUsDTO]?
    let message: String?
}

struct AboutUsDTO: Decodable {
    let name: String?
    let description: String?
    let image: String?
    let id: Int?
}

extension AboutUsDTO {
    
    var toAboutUs: AboutUs {
        AboutUs(self)
    }
}

extension Array where Element == AboutUsDTO {
    
    var toAboutUs: [AboutUs] {
        self.map({ $0.toAboutUs })
    }
}
