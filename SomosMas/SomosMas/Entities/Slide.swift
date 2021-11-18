//
//  Slide.swift
//  Somosmas
//
//  Created by Lucas Di Lorenzo on 22/10/2021.
//

import Foundation

struct Slide {
    let name: String
    let description: String
    let image: String
    
    init(_ dto: SlideDTO) {
        self.name = dto.name ?? ""
        self.description = dto.description ?? ""
        self.image = dto.image ?? ""
    }
}
