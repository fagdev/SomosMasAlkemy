//
//  Testimonials.swift
//  Somosmas
//
//  Created by Ignacio Sosa on 10/14/21.
//

import Foundation

struct Testimonial {
    let id: Int
    let name: String
    let urlImage: String
    let description: String
    
    init(_ dto: TestimonialDTO) {
        self.id = dto.id ?? 0
        self.name = dto.name ?? ""
        self.urlImage = dto.image ?? ""
        self.description = dto.description ?? ""
    }
}
