//
//  SlideDTO.swift
//  Somosmas
//
//  Created by Lucas Di Lorenzo on 22/10/2021.
//

import Foundation

struct SlideData: Decodable {
    let success: Bool?
    let data: [SlideDTO]?
    let message: String?
}

struct SlideDTO: Decodable {
    let name: String?
    let image: String?
    let description: String?
}

extension SlideDTO {
    
    var toSlide: Slide {
        Slide(self)
    }
}

extension Array where Element == SlideDTO {
    
    var toSlide: [Slide] {
        self.map({ $0.toSlide })
    }
}
