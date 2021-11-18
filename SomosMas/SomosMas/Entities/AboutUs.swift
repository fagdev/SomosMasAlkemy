//
//  AboutUs.swift
//  Somosmas
//
//  Created by Lucas Di Lorenzo on 28/10/2021.
//

import Foundation
import Foundation
struct AboutUs {
    let name: String
    let description: String
    let image: String
    let id: Int
    
    init(_ dto: AboutUsDTO) {
        self.name = dto.name ?? ""
        self.description = dto.description ?? ""
        self.image = dto.image ?? ""
        self.id = dto.id ?? 0
    }
}
