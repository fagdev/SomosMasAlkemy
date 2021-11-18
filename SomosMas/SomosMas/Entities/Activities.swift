//
//  Activities.swift
//  Somosmas
//
//  Created by Artekium on 21/10/2021.
//

import Foundation

struct Activity {
    let id: Int
    let name: String
    let description: String
    let image: String
    
    init(dto: ActivityDTO) {
        self.id = dto.id ?? 0
        self.name = dto.name ?? ""
        self.description = dto.description ?? ""
        self.image = dto.image ?? ""
    }
}
