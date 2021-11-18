//
//  TestimonialsDTO.swift
//  Somosmas
//
//  Created by Lulu Sorbelli on 10/18/21.
//

import Foundation

// MARK: - Welcome
struct TestimonialsData: Decodable {
    let success: Bool?
    let data: [TestimonialDTO]?
    let message: String?
}

// MARK: - Data
struct TestimonialDTO: Decodable {
    let id: Int?
    let name: String?
    let image: String?
    let description: String?
}

extension TestimonialDTO {
    
    var toTestimonial: Testimonial {
        Testimonial(self)
    }
}

extension Array where Element == TestimonialDTO {
    
    var toTestimonials: [Testimonial] {
        self.map({ $0.toTestimonial })
    }
}
